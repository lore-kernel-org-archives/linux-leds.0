From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt: bindings: as3645a: Fix the example node
Date: Thu, 7 Dec 2017 09:42:29 -0600
Message-ID: <CAL_JsqKG2TWLTREqNecy_3pOqLFJWa4SM4G4yzyKsZqW7opDvw@mail.gmail.com>
References: <20171205133637.30022-1-dmurphy@ti.com> <20171206215204.7qyjjd2oue7n7l37@rob-hp-laptop>
 <2c2b1fc0-6156-2897-b597-6911fee64556@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754142AbdLGPmv (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 7 Dec 2017 10:42:51 -0500
In-Reply-To: <2c2b1fc0-6156-2897-b597-6911fee64556@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Wed, Dec 6, 2017 at 4:32 PM, Dan Murphy <dmurphy@ti.com> wrote:
> Rob
>
> On 12/06/2017 03:52 PM, Rob Herring wrote:
>> On Tue, Dec 05, 2017 at 07:36:37AM -0600, Dan Murphy wrote:
>>> Fix the address-cells and size-cells example node
>>> to reflect to the correct representation.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>  Documentation/devicetree/bindings/leds/ams,as3645a.txt | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/ams,as3645a.txt b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
>>> index fdc40e354a64..8a49ccfec29b 100644
>>> --- a/Documentation/devicetree/bindings/leds/ams,as3645a.txt
>>> +++ b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
>>> @@ -59,8 +59,8 @@ Example
>>>  =======
>>>
>>>      as3645a@30 {
>>> -            #address-cells: 1
>>> -            #size-cells: 0
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>>              reg = <0x30>;
>>>              compatible = "ams,as3645a";
>>
>> Convention is also we put compatible first.
>>
>
> OK I will move that too for v2.
>
> Can that be in the same patch or do you want a separate patch?

Same patch is fine.

Rob
