From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 3/9] Documentation: dt-bindings: leds: add LM3633 LED
 binding information
Date: Mon, 07 Dec 2015 11:50:16 +0100
Message-ID: <56656468.8020300@samsung.com>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
 <1448521025-2796-4-git-send-email-milo.kim@ti.com>
 <56583C32.5030307@samsung.com> <565C0677.4030606@ti.com>
 <565C408B.9070703@samsung.com> <56654756.5050601@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:19975 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755174AbbLGKuV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Dec 2015 05:50:21 -0500
In-reply-to: <56654756.5050601@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Kim, Milo" <milo.kim@ti.com>
Cc: robh+dt@kernel.org, lee.jones@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Milo,

On 12/07/2015 09:46 AM, Kim, Milo wrote:
> Hi Jacek,
>
> On 11/30/2015 9:26 PM, Jacek Anaszewski wrote:
>> In case of LM3633 the real current outputs are banks and multiplexing
>> that occurs between banks and LVLEDn pins can be conveniently expressed
>> with the bindings I proposed above.
>>
>>> >If three output channels are controlled by one control bank, then it
>>> >should be represented as below.
>>> >
>>> >lvled-group-A {
>>> >      led-sources = <0>, <1>, <2>;
>>> >      led-max-microamp = <some value>;
>>> >}
>>> >
>>> >Please let me know if I misunderstand.
>> You silently assumed some definition of a "channel". led-sources means
>> in fact current sources, and when device is configured so that three
>> output pins are routed to the same current source, then in fact
>> they share common current source.
>
> Thanks for comments. I've modified 'led-sources' based on your feedback.
> Could you check updated dt-bindings below?
>
> * Updates
> - led-sources: List of current sources from 0 to 5.
> - ti,led-outputs: Output channel specifier
>
> The 'ti,led-outputs' property is exactly matched with datasheet
> description, so it's easy to understand which current source is used for
> output channels.
> ---
> TI LMU LM3633 LED device tree bindings
>
> Required properties:
>    - compatible: "ti,lm3633-leds"
>
> Child nodes:
>    Each node matches with LED control bank.
>    Please refer to the datasheet [1].
>
>    Required properties of a child node:
>    - led-sources: List of current sources from 0 to 5.
>                   0: control bank C for output LED 1
>                      control bank C for output LED 1 and 2
>                      control bank C for output LED 1, 2 and 3
>                   1: control bank D for output LED 2
>                   2: control bank E for output LED 3
>                   3: control bank F for output LED 4
>                      control bank F for output LED 4 and 5
>                      control bank F for output LED 4, 5 and 6
>                   4: control bank G for output LED 5
>                   5: control bank H for output LED 6
>                   Please refer to LED binding [2].
>
>    - ti,led-outputs: Output channel specifier from 0 to 5.
>                      0: LED 1
>                      1: LED 2
>                      2: LED 3
>                      3: LED 4
>                      4: LED 5
>                      5: LED 6

This property is redundant. LED class driver can infer this
information by analyzing the led-sources property from each
child node.

Below arrangement:

led1 {
	led-sources = <0>;
};

led2 {
	led-sources = <0>;
};

led3 {
	led-sources = <2>;
};

led4 {
	led-sources = <3>;
};

led5 {
	led-sources = <3>;
};

led6 {
	led-sources = <3>;
};

suffices to discover the following:

BANKC controls LVLED1, LVLED2
BANKE controls LVLED3
BANKF controls LVLED4, LVLED5, LVLED6

>    Optional properties of a child node:
>    - label: LED channel identification. Please refer to LED binding [2].
>    - led-max-microamp: Max current setting. Type is <u32>.
>                        Unit is microampere. Range is from 5000 to 29800.
>                        Step is 800. Please refer to LED binding [2].
>
> Examples:
>
> LED 1 is assigned for status LED. LED 4,5 and 6 are used for RGB
> indicator. RGB channels are controlled by bank F internally.
>
> leds {
>      compatible = "ti,lm3633-leds";
>
>      status {
>          led-sources = <0>;
>          led-max-microamp = <5000>;
>          ti,led-outputs = <0>;
>      };
>
>      rgb {
>          led-sources = <3>;
>          led-max-microamp = <6600>;
>          ti,led-outputs = <3 4 5>;
>      };
> };
>
> LED 2 is power LED. LED 5 is notification LED.
>
> leds {
>      compatible = "ti,lm3633-leds";
>
>      lvled2 {
>          label = "power";
>          led-sources = <1>;
>          led-max-microamp = <29000>;
>          ti,led-outputs = <1>;
>      };
>
>      lvled5 {
>          label = "noti";
>          led-sources = <4>;
>          led-max-microamp = <6600>;
>          ti,led-outputs = <4>;
>      };
> };
>
>
> [1] http://www.ti.com/product/LM3633/datasheet
> [2] ../leds/common.txt
>
> Best regards,
> Milo
>
>


-- 
Best Regards,
Jacek Anaszewski
