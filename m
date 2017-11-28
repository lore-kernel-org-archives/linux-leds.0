From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 1/2] dt: bindings: lm3692x: Add bindings for lm3692x
 LED driver
Date: Tue, 28 Nov 2017 11:27:11 -0600
Message-ID: <5c3706e9-2e21-1c4b-18d8-cfe96f05d0aa@ti.com>
References: <20171115194203.13572-1-dmurphy@ti.com>
 <cb5c5a65-d5a0-86a3-36b4-cf06baae9ec4@gmail.com>
 <0a78c883-f074-cc19-3c0c-fc05607400e9@ti.com> <20171115222323.GA18290@amd>
 <82336eb7-2b89-d37b-d688-4e4302766346@gmail.com>
 <16189eab-5541-9550-c027-1c9d2b5fa6d7@ti.com> <20171117112032.GA13855@amd>
 <000b01d35fc1$57ad0500$07070f00$@gmail.com>
 <17b8e1ce-092a-0449-4733-533162b26499@ti.com> <20171117235811.GA26296@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:20808 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752485AbdK1R1k (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Nov 2017 12:27:40 -0500
In-Reply-To: <20171117235811.GA26296@amd>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jingoo Han <jingoohan1@gmail.com>, 'Jacek Anaszewski' <jacek.anaszewski@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 'Lee Jones' <lee.jones@linaro.org>, 'Daniel Thompson' <daniel.thompson@linaro.org>

Pavel

On 11/17/2017 05:58 PM, Pavel Machek wrote:
> Hi!
> 
>>>> Well.. if it can control other LEDs than just backlight, I believe it
>>>> can stay in the LED subsystem.
>>>
>>> I also agree with your opinion.
>>
>> I will make the necessary changes for v4.
> 
> I'm not sure if you need to make any changes. Just add default trigger
> to the dts and you should be done.
> 

Sorry what I meant was changes for the additional v3 comments.

Dan

>> Just a heads up I won't be posting v4 until after the US holiday so you
>> don't think I abandoned everything.
> 
> :-)
> 									Pavel
> 


-- 
------------------
Dan Murphy
