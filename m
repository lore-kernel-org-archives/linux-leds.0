From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH 4/5] devicetree: leds: Introduce "panic-blink" optional property
Date: Wed, 6 Apr 2016 13:13:21 -0300
Message-ID: <CAAEAJfDVzXaXjT=E+VRKg6kDR+V-QNJrhfeFk0ritymDPvTVLA@mail.gmail.com>
References: <1459801326-5541-1-git-send-email-ezequiel@vanguardiasur.com.ar>
	<1459801326-5541-5-git-send-email-ezequiel@vanguardiasur.com.ar>
	<CAL_JsqLF-cMtGERnZ0wO_GUkhsf23LQhOm6PwwKAa5evSkOHDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:34767 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751016AbcDFQNX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 6 Apr 2016 12:13:23 -0400
Received: by mail-wm0-f48.google.com with SMTP id l6so72154507wml.1
        for <linux-leds@vger.kernel.org>; Wed, 06 Apr 2016 09:13:22 -0700 (PDT)
In-Reply-To: <CAL_JsqLF-cMtGERnZ0wO_GUkhsf23LQhOm6PwwKAa5evSkOHDg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>

On 6 April 2016 at 12:12, Rob Herring <robh@kernel.org> wrote:
> On Mon, Apr 4, 2016 at 3:22 PM, Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
>> It's desirable to specify which LEDs are to be blinked on a kernel
>> panic. Therefore, introduce a devicetree boolean property to mark
>> which LEDs should be treated this way.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
>>  Documentation/devicetree/bindings/leds/common.txt | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Doc=
umentation/devicetree/bindings/leds/common.txt
>> index 68419843e32f..dd409df9203a 100644
>> --- a/Documentation/devicetree/bindings/leds/common.txt
>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>> @@ -37,6 +37,8 @@ Optional properties for child nodes:
>>                       property is mandatory for the LEDs in the non-=
flash modes
>>                       (e.g. torch or indicator).
>>
>> +- panic-blink : Mark this LED to be used by the panic LED trigger.
>> +
>
> We already have a way to specify LED triggers. Why can't that be used=
?
>

Because this is not about specifying a LED trigger.

The use case is the following: a LED is assigned to some LED trigger.
When the kernel panics, we want to switch that LED to the panic trigger=
,
so it blinks signalling the panic.

IOW, this allows a LED to be used for "normal operation stuff trigger",
but blink if the kernel panics.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
