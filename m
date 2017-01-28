From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6 2/4] platform/x86/thinkpad: Call led_classdev_notify_brightness_hw_changed
 on kbd brightness change
Date: Sat, 28 Jan 2017 15:36:27 +0200
Message-ID: <CAHp75VcotSMy3wmmYcaWVSzpVSvHY8zxTydLiFCt1wdcxdb1Ww@mail.gmail.com>
References: <20170125161130.5424-1-hdegoede@redhat.com> <20170125161130.5424-3-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:36819 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751171AbdA1Ng2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 28 Jan 2017 08:36:28 -0500
In-Reply-To: <20170125161130.5424-3-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, linux-leds@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>

On Wed, Jan 25, 2017 at 6:11 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> Make thinkpad_acpi call led_classdev_notify_brightness_hw_changed on the
> kbd_led led_classdev registered by thinkpad_acpi when the kbd backlight
> brightness is changed through the hotkey.
>
> This will allow userspace to monitor (poll) for brightness changes on
> these LEDs caused by the hotkey.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I didn't see v7 of this and consequent patches. What's going on?

> ---
> Changes in v3:
> -This is a new patch in v3 of this patch-set
> Changes in v4:
> -No changes
> Changes in v5:
> -Switch to new led-trigger based API for notifying userspace about
>  keyboard backlight brightness changes.
> -Also call ledtrig_kbd_backlight() for laptops with a thinklight
> -Rename the hotkey defines from THINKLIGHT to KBD_LIGHT since they
>  are shared between the thinklight and the keyboard backlight
> Changes in v6:
> -Switch to new brightness_hw_changed LED class API
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index cacb43f..6249292 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -163,6 +163,7 @@ enum tpacpi_hkey_event_t {
>         TP_HKEY_EV_HOTKEY_BASE          = 0x1001, /* first hotkey (FN+F1) */
>         TP_HKEY_EV_BRGHT_UP             = 0x1010, /* Brightness up */
>         TP_HKEY_EV_BRGHT_DOWN           = 0x1011, /* Brightness down */
> +       TP_HKEY_EV_KBD_LIGHT            = 0x1012, /* Thinklight/kbd backlight */
>         TP_HKEY_EV_VOL_UP               = 0x1015, /* Volume up or unmute */
>         TP_HKEY_EV_VOL_DOWN             = 0x1016, /* Volume down or unmute */
>         TP_HKEY_EV_VOL_MUTE             = 0x1017, /* Mixer output mute */
> @@ -1959,7 +1960,7 @@ enum {    /* Positions of some of the keys in hotkey masks */
>         TP_ACPI_HKEY_HIBERNATE_MASK     = 1 << TP_ACPI_HOTKEYSCAN_FNF12,
>         TP_ACPI_HKEY_BRGHTUP_MASK       = 1 << TP_ACPI_HOTKEYSCAN_FNHOME,
>         TP_ACPI_HKEY_BRGHTDWN_MASK      = 1 << TP_ACPI_HOTKEYSCAN_FNEND,
> -       TP_ACPI_HKEY_THNKLGHT_MASK      = 1 << TP_ACPI_HOTKEYSCAN_FNPAGEUP,
> +       TP_ACPI_HKEY_KBD_LIGHT_MASK     = 1 << TP_ACPI_HOTKEYSCAN_FNPAGEUP,
>         TP_ACPI_HKEY_ZOOM_MASK          = 1 << TP_ACPI_HOTKEYSCAN_FNSPACE,
>         TP_ACPI_HKEY_VOLUP_MASK         = 1 << TP_ACPI_HOTKEYSCAN_VOLUMEUP,
>         TP_ACPI_HKEY_VOLDWN_MASK        = 1 << TP_ACPI_HOTKEYSCAN_VOLUMEDOWN,
> @@ -2344,7 +2345,7 @@ static void hotkey_read_nvram(struct tp_nvram_state *n, const u32 m)
>                 n->display_toggle = !!(d & TP_NVRAM_MASK_HKT_DISPLAY);
>                 n->hibernate_toggle = !!(d & TP_NVRAM_MASK_HKT_HIBERNATE);
>         }
> -       if (m & TP_ACPI_HKEY_THNKLGHT_MASK) {
> +       if (m & TP_ACPI_HKEY_KBD_LIGHT_MASK) {
>                 d = nvram_read_byte(TP_NVRAM_ADDR_THINKLIGHT);
>                 n->thinklight_toggle = !!(d & TP_NVRAM_MASK_THINKLIGHT);
>         }
> @@ -5193,6 +5194,7 @@ static struct tpacpi_led_classdev tpacpi_led_kbdlight = {
>         .led_classdev = {
>                 .name           = "tpacpi::kbd_backlight",
>                 .max_brightness = 2,
> +               .flags          = LED_BRIGHT_HW_CHANGED,
>                 .brightness_set = &kbdlight_sysfs_set,
>                 .brightness_get = &kbdlight_sysfs_get,
>         }
> @@ -5222,6 +5224,8 @@ static int __init kbdlight_init(struct ibm_init_struct *iibm)
>                 return rc;
>         }
>
> +       tpacpi_hotkey_driver_mask_set(hotkey_driver_mask |
> +                                     TP_ACPI_HKEY_KBD_LIGHT_MASK);
>         return 0;
>  }
>
> @@ -9169,6 +9173,10 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
>                         volume_alsa_notify_change();
>                 }
>         }
> +       if (tp_features.kbdlight && hkey_event == TP_HKEY_EV_KBD_LIGHT)
> +               led_classdev_notify_brightness_hw_changed(
> +                       &tpacpi_led_kbdlight.led_classdev,
> +                       kbdlight_sysfs_get(NULL));
>  }
>
>  static void hotkey_driver_event(const unsigned int scancode)
> --
> 2.9.3
>



-- 
With Best Regards,
Andy Shevchenko
