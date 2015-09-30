From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 2/3] leds: add debugfs to device trigger
Date: Wed, 30 Sep 2015 16:08:14 +0200
Message-ID: <560BECCE.6080304@samsung.com>
References: <cover.1443471365.git.maciek.borzecki@gmail.com>
 <ca802c20eb972c459bb8671ba203a5f0b2b2770d.1443472356.git.maciek.borzecki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <ca802c20eb972c459bb8671ba203a5f0b2b2770d.1443472356.git.maciek.borzecki@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Maciek Borzecki <maciek.borzecki@gmail.com>
Cc: linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
List-Id: linux-leds@vger.kernel.org

Hi Maciek,

Please test your solution thoroughly before submitting
the next version. Writing to debugfs register attribute
fails due to lack of proper copying from user memory,
which makes testing impossible.

Best Regards,
Jacek Anaszewski

On 09/28/2015 10:43 PM, Maciek Borzecki wrote:
> Add debugfs entries for device activity trigger. Three entries are
> created under /sys/kernel/debug/ledtrig-dev when the driver gets
> loaded. These are:
>
>    devices - cat'ing will produce a list of currently registered devices
>              in <major>:<minor> format, a line for each device.
>
>    register - echo'ing <major>:<minor> will create a trigger for this
>               device
>
>    trigger - echo'ing <major>:<minor> will fire a trigger for this device
>
> Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> ---
>   drivers/leds/trigger/ledtrig-device.c | 113 +++++++++++++++++++++++++++++++++-
>   1 file changed, 111 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/trigger/ledtrig-device.c b/drivers/leds/trigger/ledtrig-device.c
> index dbb8d7d2b4a0258149c581a040c416d412d9ceeb..6814db5e34d76974ae095d2e1c8f1f2e23dea79e 100644
> --- a/drivers/leds/trigger/ledtrig-device.c
> +++ b/drivers/leds/trigger/ledtrig-device.c
> @@ -16,15 +16,18 @@
>   #include <linux/list.h>
>   #include <linux/rwsem.h>
>   #include <linux/kdev_t.h>
> +#include <linux/fs.h>
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
>
>   #define BLINK_DELAY 30
>   static unsigned long blink_delay = BLINK_DELAY;
>
>   static DECLARE_RWSEM(devs_list_lock);
>   static LIST_HEAD(devs_list);
> +static struct dentry *debug_root;
>
>   #define MAX_NAME_LEN 20
> -
>   struct ledtrig_dev_data {
>   	char name[MAX_NAME_LEN];
>   	dev_t dev;
> @@ -114,8 +117,11 @@ void ledtrig_dev_add(dev_t dev)
>   		/* register with led triggers */
>   		led_trigger_register_simple(new_dev_trig->name,
>   					    &new_dev_trig->trig);
> -	else
> +	else {
> +		pr_warn("device %u:%u already registered\n",
> +			MAJOR(dev), MINOR(dev));
>   		kfree(new_dev_trig);
> +	}
>   }
>   EXPORT_SYMBOL(ledtrig_dev_add);
>
> @@ -167,13 +173,116 @@ static void ledtrig_dev_remove_all(void)
>   	up_write(&devs_list_lock);
>   }
>
> +static int ledtrig_dev_devices_show(struct seq_file *s, void *unused)
> +{
> +	struct ledtrig_dev_data *dev_trig;
> +
> +	down_read(&devs_list_lock);
> +	list_for_each_entry(dev_trig, &devs_list, node) {
> +		seq_printf(s, "%u:%u\n", MAJOR(dev_trig->dev),
> +			MINOR(dev_trig->dev));
> +	}
> +	up_read(&devs_list_lock);
> +	return 0;
> +}
> +
> +static int ledtrig_dev_devices_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, ledtrig_dev_devices_show,
> +			   &inode->i_private);
> +}
> +
> +static const struct file_operations debug_devices_ops = {
> +	.owner = THIS_MODULE,
> +	.open = ledtrig_dev_devices_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release
> +};
> +
> +static int get_dev_from_user(const char __user *buf, size_t size,
> +			dev_t *dev)
> +{
> +	unsigned int major;
> +	unsigned int minor;
> +	int ret;
> +
> +	WARN_ON(dev == NULL);
> +	if (dev == NULL)
> +		return -EINVAL;
> +
> +	ret = sscanf(buf, "%u:%u", &major, &minor);
> +	if (ret < 2)
> +		return -EINVAL;
> +
> +	*dev = MKDEV(major, minor);
> +	return 0;
> +}
> +
> +static ssize_t ledtrig_dev_register_write(struct file *filp,
> +					const char __user *buf,
> +					size_t size, loff_t *off)
> +{
> +	dev_t dev;
> +	int ret;
> +
> +	ret = get_dev_from_user(buf, size, &dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	pr_debug("got device %u:%u\n", MAJOR(dev), MINOR(dev));
> +	ledtrig_dev_add(dev);
> +
> +	return size;
> +}
> +
> +static const struct file_operations debug_register_ops = {
> +	.owner = THIS_MODULE,
> +	.write = ledtrig_dev_register_write,
> +};
> +
> +static ssize_t ledtrig_dev_trigger_write(struct file *filp,
> +					const char __user *buf,
> +					size_t size, loff_t *off)
> +{
> +	dev_t dev;
> +	int ret;
> +
> +	ret = get_dev_from_user(buf, size, &dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	pr_debug("trigger device %u:%u\n", MAJOR(dev), MINOR(dev));
> +	ledtrig_dev_activity(dev);
> +
> +	return size;
> +}
> +
> +static const struct file_operations debug_trigger_ops = {
> +	.owner = THIS_MODULE,
> +	.write = ledtrig_dev_trigger_write,
> +};
> +
>   static int __init ledtrig_dev_init(void)
>   {
> +	debug_root = debugfs_create_dir("ledtrig-dev", NULL);
> +
> +	if (debug_root) {
> +		debugfs_create_file("devices", 0444, debug_root, NULL,
> +				&debug_devices_ops);
> +		debugfs_create_file("register", 0200, debug_root, NULL,
> +				&debug_register_ops);
> +		debugfs_create_file("trigger", 0200, debug_root, NULL,
> +				&debug_trigger_ops);
> +	}
> +
>   	return 0;
>   }
>
>   static void __exit ledtrig_dev_exit(void)
>   {
> +	debugfs_remove_recursive(debug_root);
> +
>   	ledtrig_dev_remove_all();
>   }
>
>


