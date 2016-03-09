From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: triggers: simplify led_trigger_store
Date: Wed, 09 Mar 2016 16:29:56 +0100
Message-ID: <56E04174.1030506@samsung.com>
References: <56DF4D64.4050908@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55774 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933108AbcCIP37 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 9 Mar 2016 10:29:59 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O3S00IVK31WSN90@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 09 Mar 2016 15:29:56 +0000 (GMT)
In-reply-to: <56DF4D64.4050908@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Heiner,

Thanks for the patch. Applied to linux-leds.git.

Best regards,
Jacek Anaszewski

On 03/08/2016 11:08 PM, Heiner Kallweit wrote:
> led_trigger_store can be significantly simplified by using sysfs_streq().
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/leds/led-triggers.c | 13 ++-----------
>   1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index e1e9334..2181581 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -34,9 +34,7 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
>   		const char *buf, size_t count)
>   {
>   	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> -	char trigger_name[TRIG_NAME_MAX];
>   	struct led_trigger *trig;
> -	size_t len;
>   	int ret = count;
>
>   	mutex_lock(&led_cdev->led_access);
> @@ -46,21 +44,14 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
>   		goto unlock;
>   	}
>
> -	trigger_name[sizeof(trigger_name) - 1] = '\0';
> -	strncpy(trigger_name, buf, sizeof(trigger_name) - 1);
> -	len = strlen(trigger_name);
> -
> -	if (len && trigger_name[len - 1] == '\n')
> -		trigger_name[len - 1] = '\0';
> -
> -	if (!strcmp(trigger_name, "none")) {
> +	if (sysfs_streq(buf, "none")) {
>   		led_trigger_remove(led_cdev);
>   		goto unlock;
>   	}
>
>   	down_read(&triggers_list_lock);
>   	list_for_each_entry(trig, &trigger_list, next_trig) {
> -		if (!strcmp(trigger_name, trig->name)) {
> +		if (sysfs_streq(buf, trig->name)) {
>   			down_write(&led_cdev->trigger_lock);
>   			led_trigger_set(led_cdev, trig);
>   			up_write(&led_cdev->trigger_lock);
>
