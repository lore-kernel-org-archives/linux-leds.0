From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH 4/5] devicetree: leds: Introduce "panic-blink" optional property
Date: Wed, 6 Apr 2016 01:39:31 -0300
Message-ID: <CAAEAJfCqgiuf2uLbqA8K3fuAkiriodxL2wG4bnLeHWpsU2ULbQ@mail.gmail.com>
References: <1459801326-5541-1-git-send-email-ezequiel@vanguardiasur.com.ar>
	<1459801326-5541-5-git-send-email-ezequiel@vanguardiasur.com.ar>
	<5704301D.7040300@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:36669 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751022AbcDFEjd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 6 Apr 2016 00:39:33 -0400
Received: by mail-wm0-f42.google.com with SMTP id v188so9290803wme.1
        for <linux-leds@vger.kernel.org>; Tue, 05 Apr 2016 21:39:32 -0700 (PDT)
In-Reply-To: <5704301D.7040300@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh@kernel.org>

On 5 April 2016 at 18:37, Jacek Anaszewski <jacek.anaszewski@gmail.com>=
 wrote:
> Hi Ezequiel,
>
> On 04/04/2016 10:22 PM, Ezequiel Garcia wrote:
>>
>> It's desirable to specify which LEDs are to be blinked on a kernel
>> panic. Therefore, introduce a devicetree boolean property to mark
>> which LEDs should be treated this way.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
>>   Documentation/devicetree/bindings/leds/common.txt | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.txt
>> b/Documentation/devicetree/bindings/leds/common.txt
>> index 68419843e32f..dd409df9203a 100644
>> --- a/Documentation/devicetree/bindings/leds/common.txt
>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>> @@ -37,6 +37,8 @@ Optional properties for child nodes:
>>                        property is mandatory for the LEDs in the non=
-flash
>> modes
>>                        (e.g. torch or indicator).
>>
>> +- panic-blink : Mark this LED to be used by the panic LED trigger.
>
>
> I'd say that 'panic-indicator' would be more informative.
>

Sure, that looks much better.

> Please next time cc also devicetree list and maintainers.
>

Will do.

Thanks for the reviews!
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
