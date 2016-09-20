From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v3] leds: triggers: Check return value of
 kobject_uevent_env()
Date: Tue, 20 Sep 2016 09:09:20 +0200
Message-ID: <20160920070920.GC9768@kroah.com>
References: <1474282344-11496-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:33551 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752558AbcITHJP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Sep 2016 03:09:15 -0400
Content-Disposition: inline
In-Reply-To: <1474282344-11496-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, joe@perches.com

On Mon, Sep 19, 2016 at 12:52:24PM +0200, Jacek Anaszewski wrote:
> Log error message if kobject_uevent_env() fails in led_trigger_set().
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> ---
> Changes from v1:
> - switched to using dev_err() instead of pr_err()
> Changes from v2:
> - switched to using __func__ instead of explicit function name,
>   to simplify code maintenance
> 
>  drivers/leds/led-triggers.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index c7a38d4..431123b 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -141,7 +141,9 @@ void led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
>  	if (event) {
>  		envp[0] = event;
>  		envp[1] = NULL;
> -		kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp);
> +		if (kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp))
> +			dev_err(led_cdev->dev,
> +				"%s: Error sending uevent\n", __func__);
>  		kfree(event);
>  	}
>  }
> -- 
> 1.9.1


Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
