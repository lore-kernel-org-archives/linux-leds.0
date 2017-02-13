From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v8 3/7] platform/x86/thinkpad: Call led_classdev_notify_brightness_hw_changed
 on kbd brightness change
Date: Tue, 14 Feb 2017 00:52:53 +0200
Message-ID: <CAHp75Vdt4SNOuYTkxg_F+pSs3FY8zA9jdOWG+Cp8hzxS7vtsVQ@mail.gmail.com>
References: <20170209154417.19040-1-hdegoede@redhat.com> <20170209154417.19040-4-hdegoede@redhat.com>
 <1486663705.1046615.875913456.7B8ADABA@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <1486663705.1046615.875913456.7B8ADABA@webmail.messagingengine.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, Feb 9, 2017 at 8:08 PM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> On Thu, Feb 9, 2017, at 13:44, Hans de Goede wrote:
>> Make thinkpad_acpi call led_classdev_notify_brightness_hw_changed on the
>> kbd_led led_classdev registered by thinkpad_acpi when the kbd backlight
>> brightness is changed through the hotkey.
>>
>> This will allow userspace to monitor (poll) for brightness changes on
>> these LEDs caused by the hotkey.
>
> It will *often* do so, you assume the thinkpad firmware is far more well
> behaved than it really is :-(
>
> It is model/bios-revision specific.  Fortunately, it should works on
> most models, and there really isn't a better way of doing this (other
> than adding the event to the NVRAM poll set of some very old models,
> which is also not worth doing unless you can actually test it).
>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Thanks, thinkpad_acpi bits are applied to testing

>
> --
>   Henrique Holschuh



-- 
With Best Regards,
Andy Shevchenko
