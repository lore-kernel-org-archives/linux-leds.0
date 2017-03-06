From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: leds: document property for LED triggers
Date: Mon, 6 Mar 2017 20:59:54 +0100
Message-ID: <41dac3a5-39fb-5740-106a-980b3107fac0@gmail.com>
References: <20170228120452.10043-1-zajec5@gmail.com>
 <a6d25fb5-db5e-5643-b150-23588944674a@gmail.com>
 <290ed068-2518-50ef-4d02-394bef8b7ee9@gmail.com>
 <28982a47-20b5-f90b-c1d8-b470e4019a08@gmail.com>
 <cd92c387-f484-4806-c5fd-9c55d0fc0aef@milecki.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:34972 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753649AbdCFUAl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Mar 2017 15:00:41 -0500
In-Reply-To: <cd92c387-f484-4806-c5fd-9c55d0fc0aef@milecki.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org

On 03/06/2017 07:16 AM, Rafał Miłecki wrote:
> On 03/01/2017 10:04 PM, Jacek Anaszewski wrote:
>> On 02/28/2017 10:51 PM, Rafał Miłecki wrote:
>>> On 02/28/2017 10:38 PM, Jacek Anaszewski wrote:
>>>> I think that it would be simpler if we could initially see
>>>> a complete sample dts implementation containing all required DT
>>>> nodes. The example could contain timer trigger as well as usb-port
>>>> trigger specific bindings.
>>>
>>> Please take a look at attached patch. I used it on Tenda AC9 with:
>>>
>>> usb_trigger: usb-trigger {
>>>     trigger-type = "usbport";
>>>     ports = <&ohci_port1>, <&ehci_port1>;
>>> };
>>>
>>> usb {
>>>     label = "bcm53xx:blue:usb";
>>>     gpios = <&chipcommon 1 GPIO_ACTIVE_HIGH>;
>>>     triggers = <&usb_trigger>;
>>> };
>>
>> OK, I got it, thanks.
>>
>>>
>>>> I suppose that we should see DT nodes containing #list-cells
>>>> properties that define the quantity of phandle arguments.
>>>>
>>>> It seems that this approach allows for defining a list of elements
>>>> with variable number of arguments, i.e. what you were initially
>>>> asking for.
>>>
>>> Are you sure we need #list-cells? Can't we simply use
>>> of_count_phandle_with_args(np, "triggers", NULL);
>>> ?
>>
>> I'm not sure, I just read the function documentation :-)
>> I haven't verified nor have I used this API.
> 
> So we could use #list-cells to support something like:
> 
> usb {
>     label = "bcm53xx:blue:usb";
>     gpios = <&chipcommon 1 GPIO_ACTIVE_HIGH>;
>     triggers = <&usb_trigger 1 2>, <&timer_trigger 3 4 5>;
> };
> 
> but I don't see any need for this. Just specifying triggers like:
> triggers = <&usb_trigger>, <&timer_trigger>, <&foo>;
> should be always enough, especially with the new trigger nodes you
> suggested.

Indeed, it seems to be not needed for this approach.
I'm OK with this design.

-- 
Best regards,
Jacek Anaszewski
