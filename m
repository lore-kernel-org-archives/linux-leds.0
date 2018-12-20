From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 2/2] leds: lp5024: Add the LP5024/18 RGB LED driver
Date: Thu, 20 Dec 2018 08:03:29 -0600
Message-ID: <8bc77441-eb22-8748-b00b-59d403794c24@ti.com>
References: <20181219162626.12297-3-dmurphy@ti.com>
 <20181219193455.GA21159@amd> <8740cfd6-a6b5-ad27-313b-984a9febf18a@ti.com>
 <20181219201047.GA23448@amd> <fd624cc1-9997-1cd5-c5cc-62e6897997cf@ti.com>
 <54f28115-0a7d-8e9c-3bec-6e91fb3981ec@gmail.com> <20181219220326.GA28244@amd>
 <a3214ab3-9281-19d6-7fcc-5abae9a60ebd@ti.com> <20181219222737.GB30496@amd>
 <d7edfd57-20df-bd83-b616-5b18e8bc2c64@ti.com> <20181220090612.GA21972@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181220090612.GA21972@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 12/20/2018 03:06 AM, Pavel Machek wrote:
> Hi!
> 
>>> Anyway, if your 36 channels can be set independently, I believe you
>>> just want them to export as 36 LEDs.
>>
>> I am not sure that is what the "customers" would want to have to set 36 different nodes or even declare those 36 nodes.
>> That is 36 independent user space to kernel space calls that are very expensive just to set a LED color and brightness.
>>
> 
> No, 36 independend calls to kernel space are not that expensive.

But they are time consuming.

Also note that even if I set the OUTX color mix register the LEDX brightness register controls the output intensity.

So if the brightness is 0x0 and the Mix register is 0xff then the LED is still off.

I am sticking with the driver as is.  I think this is a better representation of the part and its capability then presenting x number of
sysfs nodes that will have no affect on the LED if set until the corresponding brightness register is not set properly.

This will also keep the device tree entries down to a minimum.  The LEDx brightness register actually
controls the output and there are only 7 of these.

Dan

> 
> 									Pavel
> 


-- 
------------------
Dan Murphy
