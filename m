From: Florian Vaussard <florian.vaussard@gmail.com>
Subject: Re: [PATCH v3 1/2] leds: ncp5623: Add device tree binding
 documentation
Date: Wed, 28 Sep 2016 12:04:34 +0200
Message-ID: <a1bc95d5-a460-b4c7-5392-93fda0cc4f7a@gmail.com>
References: <1474025672-5040-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1474025672-5040-2-git-send-email-florian.vaussard@heig-vd.ch>
 <20160924115823.GA8696@amd> <bd220063-5c66-c428-738f-0eeb5f4f0bc7@gmail.com>
Reply-To: florian.vaussard@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36793 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752186AbcI1KEj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Sep 2016 06:04:39 -0400
In-Reply-To: <bd220063-5c66-c428-738f-0eeb5f4f0bc7@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Vaussard <florian.vaussard@heig-vd.ch>

Hello Jacek,

Le 24. 09. 16 à 21:06, Jacek Anaszewski a écrit :
> On 09/24/2016 01:58 PM, Pavel Machek wrote:
>> Hi!
>>
>>> +Example
>>> +=======
>>> +
>>> +led1: ncp5623@38 {
>>> +    #address-cells = <1>;
>>> +    #size-cells = <0>;
>>> +    compatible = "onnn,ncp5623";
>>> +    reg = <0x38>;
>>> +    onnn,led-iref-microamp = <10>;
>>> +
>>> +    led1r@0 {
>>> +        label = "ncp:power:red";
>>> +        linux,default-trigger = "default-on";
>> ...
>>> +    led1b@1 {
>>> +        label = "ncp:power:blue";
>>> +        reg = <1>;
>>
>> Actually... the three LEDs are packaged such as this is one colorful
>> light to the user, right? Some day we'll need to group them, so that
>> kernel can automatically tell this is one led, and probably add extra
>> attributes, such as values that produce white light.
> 
> We could try out the trigger approach we discussed few months ago.
> Unfortunately I currently don't have enough time to propose the
> implementation. Probably this work could be done on the occasion of
> addition of RGB LED class driver like this, if the author had free
> bandwidth for that.
> 

Unfortunately my bandwidth is pretty well used at the moment :)

Best regards,
Florian
