#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <termios.h>

#define BUFF_SIZE 64
int main(void)
{

    int fd;
    char input[BUFF_SIZE], output[BUFF_SIZE];
    const char device[] = "/dev/pts/5"; /* Hard coded device, TODO make it argument of the program */
    struct termios config;

    printf("Please give a string to send to guest:\n");
    fgets(input, BUFF_SIZE, stdin);
    
    /* First open the device as non-blocking, but then make it blocking again, as it is a lot easier for writting the program */

    fd = open(device, O_RDWR | O_NOCTTY | O_NONBLOCK);
    
    if (fd == -1) {
        printf("Failed to open port\n");
        return 1;
    }
        fcntl(fd, F_SETFL, 0);


    if(tcgetattr(fd, &config) < 0) {
        printf("Couln't get the data of the terminal\n");
        return 1;
    }

    /* Print data of terminal, just for debugging purposes. 
    printf("iflag: %x, oflag: %x, lflag: %x cflag: %x\n", 
        config.c_iflag, config.c_oflag, config.c_lflag, config.c_cflag);
    */

    /*
    cfmakeraw() sets the terminal to something like the "raw" mode of the old Version 7 terminal driver: input is available character by character, echoing is disabled, and all special processing of terminal input and output characters is disabled. The terminal attributes are set as follows:
    termios_p->c_iflag &= ~(IGNBRK | BRKINT | PARMRK | ISTRIP
                    | INLCR | IGNCR | ICRNL | IXON);
    termios_p->c_oflag &= ~OPOST;
    termios_p->c_lflag &= ~(ECHO | ECHONL | ICANON | ISIG | IEXTEN);
    termios_p->c_cflag &= ~(CSIZE | PARENB);
    termios_p->c_cflag |= CS8;
    */

    /* We first make raw the connection and then we return it to cannon. This is to ensure proper settings alingment with the guest */
    cfmakeraw(&config);
    config.c_lflag |= ICANON; /* Make port canonical */
    config.c_cflag |= (CLOCAL | CREAD);
    config.c_cflag &= ~CSTOPB;
    config.c_cc[VMIN] = 5; /* Not relevant setting */
    config.c_cc[VTIME] = 255; /* Not relevant setting */

    /* Again debuggin purposes 
    printf("iflag: %x, oflag: %x, lflag: %x cflag: %x\n", 
        config.c_iflag, config.c_oflag, config.c_lflag, config.c_cflag);
    */

   /* Set baud speed */
    if(cfsetispeed(&config, B9600) < 0 || cfsetospeed(&config, B9600) < 0) {
        printf("Problem with baudrate\n");
        return 1;
    }

    /* Finally, apply the configuration */
    if(tcsetattr(fd, TCSANOW, &config) < 0) {
        printf("Couldn't apply settings\n");
        return 1;
    }

    tcflush(fd, TCIOFLUSH); /* Clear everything that is in the terminal*/

    //printf("Sending to guest...\n");

    write(fd, input, BUFF_SIZE);
    
    //printf("Reading to guest...\n");

    while (read(fd, output, BUFF_SIZE) <= 0); /* Non blocking loop, but we don't need it, as we have blocking functions, still doesn't hurt us */
    
    printf("The most frequent character is %c and it appeared %d times.\n", output[0], output[2]);
    
    close(fd);
    return 0;
}