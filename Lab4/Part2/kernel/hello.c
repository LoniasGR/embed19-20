#include <linux/kernel.h>

asmlinkage long sys_hello(void) 
{
  printk("Greeting from kernel and team no B5.\n");
  return 0;
}
