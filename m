From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3697
Date: Tue, 30 Oct 2018 08:40:04 -0500
Message-ID: <bdb73aa2-60d9-3356-f934-091f738e20a0@ti.com>
References: <20181023170623.31820-1-dmurphy@ti.com>
 <20181023170623.31820-2-dmurphy@ti.com> <20181024090421.GB24997@amd>
 <e8800c2e-8ada-7a0d-c1a6-14ddcbe1576d@ti.com> <20181024145434.GC9327@bogus>
 <beb1a6e1-8120-be94-b1a4-60ea6721765d@ti.com>
 <ade3121a-58ab-c0c3-6605-cf7d6a638da0@gmail.com> <20181026083703.GB19434@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181026083703.GB19434@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, lee.jones@linaro.org, tony@atomide.com
List-Id: linux-leds@vger.kernel.org

All

On 10/26/2018 03:37 AM, Pavel Machek wrote:
> Hi!
> 
>>> Do you have an opinion on this?
>>
>> This is this problem with the Device Tree's scope of responsibility.
>> It is defined as a means for "describing the hardware", but often
>> this rule is abused by the properties that fall into "configuration"
>> category. E.g. default-state, retain-state-suspended from leds-gpio.txt
>> or linux-default-trigger from common LED bindings.
> 
> "retain-state-suspended" is actually hardware property. On PCs,
> (most?) LEDs will go off in suspend. On android phones, LEDs stay on
> while suspended.
> 
> "linux-default-trigger" is actually kind-of hardware property, too. If
> LED has an icon near it (or on it), you want to use that LED in that
> meaning.
> 
> (Thinkpad X60 has "wifi", "bluetooth", "numlock", "capslock", "hdd",
> "power", "battery", "ac" and "sleep" leds. Surely we should use them
> in that meaning?)
> 
> Now, if someone has leds labeled "user 1..user 4" and uses
> "linux-default-trigger" there, that is kind of "more interesting".
> 
> "default-state" is similar (subset of "linux-default-trigger"); you
> don't want power LED to go off during kernel boot...


I just want to follow up here and let you know that I have not abandoned this.
I am trying to rework and fix up the ti lmu binding as asked by Pavel.  Its proving
to be a bit of a challenge based on looking forward to what will be the implementation.

I also did go offline and speak with Tony.  I have a Droid 4 so I can test all of this on
production hardware as well.

Updated patchset will take some time to get out.

Dan

> 
> 								Pavel
> 


-- 
------------------
Dan Murphy
