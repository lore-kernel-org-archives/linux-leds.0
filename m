From: Rob Herring <robh@kernel.org>
Subject: Re: dts: fun with chip names Re: [PATCH v3 1/2] dt: bindings:
 lm3692x: Add bindings for lm3692x LED driver
Date: Thu, 16 Nov 2017 14:36:01 -0600
Message-ID: <CAL_Jsq+aysVR9U2Wquwwv7cjjO7wO8EXBg1Ja82u6s5t1yeJUw@mail.gmail.com>
References: <20171115194203.13572-1-dmurphy@ti.com> <20171116154139.wed7qmpmv2ffyzv2@rob-hp-laptop>
 <d3483e49-650d-1d68-bec6-eeb84d8ac48a@ti.com> <20171116201121.GA28848@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759251AbdKPUgX (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 16 Nov 2017 15:36:23 -0500
In-Reply-To: <20171116201121.GA28848@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>, Mark Rutland <mark.rutland@arm.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Thu, Nov 16, 2017 at 2:11 PM, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
>> >> +Required properties:
>> >> +  - compatible:
>> >> +          "ti,lm3692x"
>> >
>> > Don't use wildcards in compatible strings.
>>
>> Do you mean to remove the x?  How do we denote a family of parts
>> then?
>
> I guess you should specify the exact chip.
>
> Which will present interesting problem for me on Nokia N9/N950; in one
> case, compatible chip is produced by two companies, and it looks like
> some machines have one and some have the other; but we'd like to share
> the dts as user has no chance telling them apart (and it is not
> important, anyway).
>
> In second case, chip is refered as APDS990X and I don't know where to
> get more exact data.

There's always exceptions to rules. Just make the case for it. IIRC,
there was the same case for the BT chip.

Rob
