From: Nick Crews <ncrews@chromium.org>
Subject: Re: [PATCH v5 3/3] platform/chrome: Standardize Chrome OS keyboard
 backlight name
Date: Mon, 8 Apr 2019 17:58:16 -0600
Message-ID: <CAHX4x87XiNMnjr+-2A2yHgKbZLaDBXO-U1Uij2sCq=gH9Vv4jw@mail.gmail.com>
References: <20190404171007.160878-1-ncrews@chromium.org> <20190404171007.160878-3-ncrews@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404171007.160878-3-ncrews@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Simon Glass <sjg@google.com>, Guenter Roeck <groeck@google.com>, Dmitry Torokhov <dtor@google.com>
List-Id: linux-leds@vger.kernel.org

I've just found a few [embarrassing :)] bugs in this version,
so after we figure out the naming, please wait for me to send
out another patch that fixes these.

Thanks, Nick

On Thu, Apr 4, 2019 at 11:10 AM Nick Crews <ncrews@chromium.org> wrote:
>
> We want all backlights for the system keyboard to
> use a common name, so the name "platform::kbd_backlight"
> would be better than the current "chromeos::kbd_backlight"
> name. Normally this wouldn't be worth changing, but the new
> Wilco keyboard backlight driver uses the "platform" name.
> We want to make it so all Chrome OS devices are consistent,
> so we'll change the name here too.
>
> The Power Manager daemon only looks for LEDs that match the
> pattern "*:kbd_backlight", so this change won't affect that.
>
> Signed-off-by: Nick Crews <ncrews@chromium.org>
> ---
>  drivers/platform/chrome/cros_kbd_led_backlight.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
> index aa409f0201fb..c56c8405f39c 100644
> --- a/drivers/platform/chrome/cros_kbd_led_backlight.c
> +++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
> @@ -77,7 +77,7 @@ static int keyboard_led_probe(struct platform_device *pdev)
>         if (!cdev)
>                 return -ENOMEM;
>
> -       cdev->name = "chromeos::kbd_backlight";
> +       cdev->name = "platform::kbd_backlight";
>         cdev->max_brightness = ACPI_KEYBOARD_BACKLIGHT_MAX;
>         cdev->flags |= LED_CORE_SUSPENDRESUME;
>         cdev->brightness_set = keyboard_led_set_brightness;
> --
> 2.20.1
>
