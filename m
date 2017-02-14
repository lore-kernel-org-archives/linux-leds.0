From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 3/7] platform/x86/thinkpad: Call
 led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Tue, 14 Feb 2017 10:25:24 +0100
Message-ID: <40d0f346-5090-ef01-4ee7-69b72458cfa2@redhat.com>
References: <20170209154417.19040-1-hdegoede@redhat.com>
 <20170209154417.19040-4-hdegoede@redhat.com>
 <1486663705.1046615.875913456.7B8ADABA@webmail.messagingengine.com>
 <CAHp75Vdt4SNOuYTkxg_F+pSs3FY8zA9jdOWG+Cp8hzxS7vtsVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46668 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753052AbdBNJZ2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 14 Feb 2017 04:25:28 -0500
In-Reply-To: <CAHp75Vdt4SNOuYTkxg_F+pSs3FY8zA9jdOWG+Cp8hzxS7vtsVQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-leds@vger.kernel.org

Hi,

On 13-02-17 23:52, Andy Shevchenko wrote:
> On Thu, Feb 9, 2017 at 8:08 PM, Henrique de Moraes Holschuh
> <hmh@hmh.eng.br> wrote:
>> On Thu, Feb 9, 2017, at 13:44, Hans de Goede wrote:
>>> Make thinkpad_acpi call led_classdev_notify_brightness_hw_changed on the
>>> kbd_led led_classdev registered by thinkpad_acpi when the kbd backlight
>>> brightness is changed through the hotkey.
>>>
>>> This will allow userspace to monitor (poll) for brightness changes on
>>> these LEDs caused by the hotkey.
>>
>> It will *often* do so, you assume the thinkpad firmware is far more well
>> behaved than it really is :-(
>>
>> It is model/bios-revision specific.  Fortunately, it should works on
>> most models, and there really isn't a better way of doing this (other
>> than adding the event to the NVRAM poll set of some very old models,
>> which is also not worth doing unless you can actually test it).
>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
>
> Thanks, thinkpad_acpi bits are applied to testing

Thank you, so the Dell bits are waiting for Pali's ack ?

Note the Dell bits have been tested on actual hardware too.

Regards,

Hans
