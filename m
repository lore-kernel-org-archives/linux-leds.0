From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: leds: document new trigger-sources property
Date: Mon, 29 May 2017 22:12:35 +0200
Message-ID: <CACna6rxFScBo_ak1iDJrbnjfTke4Ef6=pAO1V-Tt7hyM=1U8KA@mail.gmail.com>
References: <20170529140142.13496-1-zajec5@gmail.com> <20170529140142.13496-2-zajec5@gmail.com>
 <c12584bf-f0ab-337e-a8e8-e66e88026735@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35739 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750873AbdE2UMg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 May 2017 16:12:36 -0400
In-Reply-To: <c12584bf-f0ab-337e-a8e8-e66e88026735@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>

On 29 May 2017 at 21:52, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrot=
e:
> On 05/29/2017 04:01 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>
>> Some LEDs can be related to a specific device(s) described in the DT.
>> This property allows specifying such relations. E.g. USB LED should
>> usually be used to indicate some USB port(s) state.
>>
>> Please note this binding is designed to be generic and not influenced by
>> any operating system design. Linux developers may find "trigger" part a
>> bit confusing since in Linux triggers are separated drivers. It
>> shouldn't define the binding though (we shouldn't add an extra level of
>> indirection).
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>> ---
>> V2: Replace "usb-ports" with "led-triggers" property which is more gener=
ic and
>>     allows specifying other devices as well.
>> V3: Use "trigger-sources" which is even more accurate as devices aren't
>>     precisely triggers.
>> ---
>>  Documentation/devicetree/bindings/leds/common.txt | 18 ++++++++++++++++=
++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documen=
tation/devicetree/bindings/leds/common.txt
>> index 24b656014089..e6e300975a4c 100644
>> --- a/Documentation/devicetree/bindings/leds/common.txt
>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>> @@ -49,6 +49,19 @@ Optional properties for child nodes:
>>  - panic-indicator : This property specifies that the LED should be used=
,
>>                   if at all possible, as a panic indicator.
>>
>> +- trigger-sources : List of devices which should be used as a source tr=
iggering
>> +                 this LED activity. Some LEDs can be related to a speci=
fic
>> +                 device and should somehow indicate its state. E.g. USB=
 2.0
>> +                 LED may react to device(s) in a USB 2.0 port(s).
>> +                 Another common example is switch or router with multip=
le
>> +                 Ethernet ports each of them having its own LED assigne=
d
>> +                 (assuming they are not hardwired). In such cases this
>> +                 property should contain phandle(s) of related source
>> +                 device(s).
>> +                 In many cases LED can be related to more than one devi=
ce
>> +                 (e.g. one USB LED vs. multiple USB ports) so a list of
>> +                 sources can be specified.
>> +
>>  Required properties for flash LED child nodes:
>>  - flash-max-microamp : Maximum flash LED supply current in microamperes=
.
>>  - flash-max-timeout-us : Maximum timeout in microseconds after which th=
e flash
>> @@ -69,6 +82,11 @@ gpio-leds {
>>               linux,default-trigger =3D "heartbeat";
>>               gpios =3D <&gpio0 0 GPIO_ACTIVE_HIGH>;
>>       };
>> +
>> +     usb {
>> +             gpios =3D <&gpio0 1 GPIO_ACTIVE_HIGH>;
>> +             led-triggers =3D <&ohci_port1>, <&ehci_port1>;
>
> Didn't you mean "trigger-sources" here instead?

Oh, thanks for catching that.

--=20
Rafa=C5=82
