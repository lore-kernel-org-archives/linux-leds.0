From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 3/6] platform/x86: thinkpad_acpi: Add audio
 mute LED classdev support
Date: Tue, 27 Nov 2018 01:04:40 +0200
Message-ID: <CAHp75Vc24pHmDsBSFacd_HW55oodk6C1c_ZNZU1SUTiEH7gOdA@mail.gmail.com>
References: <20181126171126.20280-1-tiwai@suse.de>
 <20181126171126.20280-4-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20181126171126.20280-4-tiwai@suse.de>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Takashi Iwai <tiwai@suse.de>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>, Ayman Bagabas <ayman.bagabas@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Hui Wang <hui.wang@canonical.com>, ibm-acpi-devel@lists.sourceforge.net, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Mon, Nov 26, 2018 at 7:13 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> In the upcoming change, the binding of audio mute / mic-mute LED
> controls will be switched with LED trigger.  This patch is the last
> piece of preparation: adding the audio mute / mic-mute LED class
> devices to thinkpad_acpi driver.
>
> Two devices, tpacpi::mute and tpacpi::micmute, will be added for
> controlling the mute LED and mic-mute LED, respectively.
>
> Also this selects CONFIG_LEDS_TRIGGERS and CONFIG_LEDS_TRIGGERS_AUDIO
> unconditionally.  Strictly speaking, these aren't 100% mandatory, but
> leaving these manual selections would lead to a functional regression
> easily once after converting from the dynamic symbol binding to the
> LEDs trigger in a later patch.

> +               if (!ACPI_SUCCESS(acpi_get_handle(hkey_handle, t->name, &temp))) {

ACPI_FAILURE()

>                         t->state = -ENODEV;
> +                       continue;
> +               }

> +               err = led_classdev_register(&tpacpi_pdev->dev, &mute_led_cdev[i]);
> +               if (err < 0) {

> +                       while (--i >= 0)

Needs { } due to two liner below.

Might be converted to simple

while (i--) {
 ...
}

btw.

> +                               if (led_tables[i].state >= 0)
> +                                       led_classdev_unregister(&mute_led_cdev[i]);
> +                       return err;
> +               }

--
With Best Regards,
Andy Shevchenko
