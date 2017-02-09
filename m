From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v8 2/7] platform/x86/thinkpad_acpi: Use
 brightness_set_blocking callback for LEDs
Date: Thu, 09 Feb 2017 16:00:16 -0200
Message-ID: <1486663216.1043881.875902856.2EF773DE@webmail.messagingengine.com>
References: <20170209154417.19040-1-hdegoede@redhat.com>
 <20170209154417.19040-3-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170209154417.19040-3-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?utf-8?Q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, Feb 9, 2017, at 13:44, Hans de Goede wrote:
> Now a days the LED core can take care of executing brightness_set from
> a workqueue if it needs to sleep, make use of this and remove a bunch
> of DIY code for this.
> 
> Since this commit removes the workqueue usage for LEDs, the
> led_sysfs_blink_set callback may now also sleep, this is fine.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

For the thinkpad-acpi bits:
Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

BTW, one sure-fire way to test this is to attach a trigger fired from
atomic context.  If it doesn't defer to a workqueue, the machine *will*
crash.  Thinkpad-acpi LEDs need to sleep (and will trigger an SMI, etc,
etc).

-- 
  Henrique Holschuh
