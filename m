From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v8 0/7] platform/x86: Notify userspace about hotkeys
 changing kbd-backlight brightness
Date: Thu, 9 Feb 2017 21:21:27 +0100
Message-ID: <ae6a4532-ae87-33e2-48e2-22e7df75aac2@gmail.com>
References: <20170209154417.19040-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170209154417.19040-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Pavel Machek <pavel@ucw.cz>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 02/09/2017 04:44 PM, Hans de Goede wrote:
> Hi All,
> 
> Here is v8 of the platform drivers changes matching / using the new
> v8 LED subsys led_classdev_notify_brightness_hw_changed() functionality
> queued in -next.
> 
> There have been some changes (and preparation patches added) compared
> to the previous versions since the new LED api requires the driver to
> only call led_classdev_notify_brightness_hw_changed() on hotkey triggered
> changes and the ACPI events indicating brightness changes also get
> triggered when setting the brightness to led_set_brightness (or sysfs).
> 
> This series depends on the patch adding
> led_classdev_notify_brightness_hw_changed() to the LED subsystem,
> Jacek can you create a stable branch with just that patch which the
> platform/x86 platform maintainers can merge, so that they can apply
> this series ?

Created branch led_brightness_hw_changed on
git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
