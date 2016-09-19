From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] leds: triggers: Check return value of
 kobject_uevent_env()
Date: Mon, 19 Sep 2016 10:56:46 +0200
Message-ID: <20160919085646.GA2722@kroah.com>
References: <1474273371-6535-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:34497 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751694AbcISI4k (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 19 Sep 2016 04:56:40 -0400
Content-Disposition: inline
In-Reply-To: <1474273371-6535-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>

On Mon, Sep 19, 2016 at 10:22:51AM +0200, Jacek Anaszewski wrote:
> From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> 
> Log error message if kobject_uevent_env() fails in led_trigger_set().
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> ---
>  drivers/leds/led-triggers.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index c7a38d4..f538e8c 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -141,7 +141,8 @@ void led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
>  	if (event) {
>  		envp[0] = event;
>  		envp[1] = NULL;
> -		kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp);
> +		if (kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp))
> +			pr_err("Error sending uevent after setting LED trigger\n");

You have a device, please use dev_err() for stuff like this, so that you
know what exact device caused the problem.

thanks,

greg k-h
