From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2] leds: triggers: Check return value of
 kobject_uevent_env()
Date: Mon, 19 Sep 2016 03:19:10 -0700
Message-ID: <1474280350.1954.20.camel@perches.com>
References: <1474279534-30204-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474279534-30204-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, greg@kroah.com
List-Id: linux-leds@vger.kernel.org

On Mon, 2016-09-19 at 12:05 +0200, Jacek Anaszewski wrote:
> Log error message if kobject_uevent_env() fails in led_trigger_set().

trivia:

> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
[]
> @@ -141,7 +141,9 @@ void led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
>  	if (event) {
>  		envp[0] = event;
>  		envp[1] = NULL;
> -		kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp);
> +		if (kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp))
> +			dev_err(led_cdev->dev,
> +				"led_trigger_set: Error sending uevent\n");

It is generally better to use %s, __func__ than to embed
a function name in the format string.

+			dev_err(led_cdev->dev, "%s: Error sending uevent\n",
+				__func__);

Then Function renaming and code refactoring is less
error prone.
