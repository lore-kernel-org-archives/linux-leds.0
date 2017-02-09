From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v8 1/7] platform/x86/thinkpad_acpi: Stop setting led_classdev
 brightness directly
Date: Thu, 09 Feb 2017 16:09:17 -0200
Message-ID: <1486663757.1046783.875913984.4510B8A1@webmail.messagingengine.com>
References: <20170209154417.19040-1-hdegoede@redhat.com>
 <20170209154417.19040-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170209154417.19040-2-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?utf-8?Q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, Feb 9, 2017, at 13:44, Hans de Goede wrote:
> There is no need to set the led_classdev's brightness value from
> its set_brightness callback, this is taken care of by the led-core and
> thinkpad_acpi really should not be mucking with it.
> 
> Note that kbdlight_set_level_and_update() is still used by the old
> thinpad_acpi specific sysfs interface for the led, so we cannot
> remove it.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>


-- 
  Henrique Holschuh
