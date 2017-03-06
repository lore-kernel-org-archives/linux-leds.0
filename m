From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/4] dt-bindings: leds: document property for LED triggers
Date: Mon, 6 Mar 2017 07:16:26 +0100
Message-ID: <cd92c387-f484-4806-c5fd-9c55d0fc0aef@milecki.pl>
References: <20170228120452.10043-1-zajec5@gmail.com>
 <a6d25fb5-db5e-5643-b150-23588944674a@gmail.com>
 <290ed068-2518-50ef-4d02-394bef8b7ee9@gmail.com>
 <28982a47-20b5-f90b-c1d8-b470e4019a08@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 20.mo7.mail-out.ovh.net ([46.105.49.208]:36739 "EHLO
        20.mo7.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754353AbdCFJwp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Mar 2017 04:52:45 -0500
Received: from player762.ha.ovh.net (b7.ovh.net [213.186.33.57])
        by mo7.mail-out.ovh.net (Postfix) with ESMTP id 496E942E20
        for <linux-leds@vger.kernel.org>; Mon,  6 Mar 2017 07:16:33 +0100 (CET)
In-Reply-To: <28982a47-20b5-f90b-c1d8-b470e4019a08@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org

On 03/01/2017 10:04 PM, Jacek Anaszewski wrote:
> On 02/28/2017 10:51 PM, Rafał Miłecki wrote:
>> On 02/28/2017 10:38 PM, Jacek Anaszewski wrote:
>>> I think that it would be simpler if we could initially see
>>> a complete sample dts implementation containing all required DT
>>> nodes. The example could contain timer trigger as well as usb-port
>>> trigger specific bindings.
>>
>> Please take a look at attached patch. I used it on Tenda AC9 with:
>>
>> usb_trigger: usb-trigger {
>>     trigger-type = "usbport";
>>     ports = <&ohci_port1>, <&ehci_port1>;
>> };
>>
>> usb {
>>     label = "bcm53xx:blue:usb";
>>     gpios = <&chipcommon 1 GPIO_ACTIVE_HIGH>;
>>     triggers = <&usb_trigger>;
>> };
>
> OK, I got it, thanks.
>
>>
>>> I suppose that we should see DT nodes containing #list-cells
>>> properties that define the quantity of phandle arguments.
>>>
>>> It seems that this approach allows for defining a list of elements
>>> with variable number of arguments, i.e. what you were initially
>>> asking for.
>>
>> Are you sure we need #list-cells? Can't we simply use
>> of_count_phandle_with_args(np, "triggers", NULL);
>> ?
>
> I'm not sure, I just read the function documentation :-)
> I haven't verified nor have I used this API.

So we could use #list-cells to support something like:

usb {
	label = "bcm53xx:blue:usb";
	gpios = <&chipcommon 1 GPIO_ACTIVE_HIGH>;
	triggers = <&usb_trigger 1 2>, <&timer_trigger 3 4 5>;
};

but I don't see any need for this. Just specifying triggers like:
triggers = <&usb_trigger>, <&timer_trigger>, <&foo>;
should be always enough, especially with the new trigger nodes you suggested.
