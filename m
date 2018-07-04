From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Fix platform data in leds-pca955x.c
Date: Wed, 4 Jul 2018 23:17:35 +0300
Message-ID: <CAHp75VdLpDSS9M_y=DhcCCJW1bZA7TXpSVaairbGCPxtiyiwMA@mail.gmail.com>
References: <62fb47ea-9296-139b-1eeb-28ddc5826091@landley.net>
 <CAHp75Vc+2rjFcLfuV5ao0eGmz2aF4jRS_YTZQTaRx=45sOSFOw@mail.gmail.com>
 <CAHp75VdEUquwcd3_OxbHAK+gOCnpff_Fd91jkHx87XKkD2xwKQ@mail.gmail.com> <fda04867-b470-5266-65db-edb90023f8dc@landley.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fda04867-b470-5266-65db-edb90023f8dc@landley.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Landley <rob@landley.net>
Cc: clg@kaod.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Andrew Jeffery <andrew@aj.id.au>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Wed, Jul 4, 2018 at 9:09 PM, Rob Landley <rob@landley.net> wrote:
> On 07/04/2018 12:04 PM, Andy Shevchenko wrote:
>> On Wed, Jul 4, 2018 at 8:00 PM, Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>> On Wed, Jul 4, 2018 at 3:46 AM, Rob Landley <rob@landley.net> wrote:
>>
>>> For now, you can switch to unified device properties API (basically
>>> un-ifdef pca955x_pdata_of_init() and replacing of_* by device_* or
>>> fwnode_* compatible calls) and providing a static table of built-in
>>> device properties in the platform code in question.
>>> (see include/linux/property.h, for example users of
>>> PROPERTY_ENTRY_U*() macros, like arch/arm/mach-pxa/raumfeld.c)
>>
>> Taking into consideration that device is enumerated by i2c core, which
>> is being aware of device properties (1), better example might be
>> drivers/platform/x86/intel_cht_int33fe.c
>
> This file doesn't include the word "LED".

Should it?
You seems missed a point completely.

>
>   $ grep -i led drivers/platform/x86/intel_cht_int33fe.c
>   $
>
> Examining it... this is an ACPI driver, Intel's Not-Invented-Here proprietary
> device tree.

Huh?!

> So I should convert an sh7760 board to ACPI?

NO! (Of cource if you have ACPI ID and meaning of that device on ACPI
enabled platform, then it's your choice)

>  How would this fix the problem
> where the driver's probe function expects a structure as input that is locally
> defined, instead of the generic structure from linux/leds.h it used to accept?

You missed a point.

> If we feed the probe function NULL platform data _and_ don't have device tree
> enabled, doesn't it error out?

No.

-- 
With Best Regards,
Andy Shevchenko
