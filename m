From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v8 3/7] platform/x86/thinkpad: Call led_classdev_notify_brightness_hw_changed
 on kbd brightness change
Date: Tue, 14 Feb 2017 11:33:49 +0200
Message-ID: <CAHp75VcFE6Jxnk8qBjPst4w9DP3KLNmxzg1ZSwzz5Qw9xhdmRg@mail.gmail.com>
References: <20170209154417.19040-1-hdegoede@redhat.com> <20170209154417.19040-4-hdegoede@redhat.com>
 <1486663705.1046615.875913456.7B8ADABA@webmail.messagingengine.com>
 <CAHp75Vdt4SNOuYTkxg_F+pSs3FY8zA9jdOWG+Cp8hzxS7vtsVQ@mail.gmail.com> <40d0f346-5090-ef01-4ee7-69b72458cfa2@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <40d0f346-5090-ef01-4ee7-69b72458cfa2@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, Feb 14, 2017 at 11:25 AM, Hans de Goede <hdegoede@redhat.com> wrote:
> On 13-02-17 23:52, Andy Shevchenko wrote:
>> On Thu, Feb 9, 2017 at 8:08 PM, Henrique de Moraes Holschuh
>> <hmh@hmh.eng.br> wrote:
>>> On Thu, Feb 9, 2017, at 13:44, Hans de Goede wrote:

>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

>> Thanks, thinkpad_acpi bits are applied to testing

> Thank you, so the Dell bits are waiting for Pali's ack ?
> Note the Dell bits have been tested on actual hardware too.

This cycle shows a flaw in my understanding of process. I've
mistakenly pushed couple of patches without maintainers' review. So, I
guess from now on we highly recommend to have a tag from actual
maintainer before we are going to proceed.

Darren, if you think this is too strong, what would be better approach?

-- 
With Best Regards,
Andy Shevchenko
