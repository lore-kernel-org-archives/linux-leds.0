From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH RESEND v6 1/2] leds: tlc591xx: Document binding for the TI
 8/16 Channel i2c LED driver
Date: Mon, 20 Apr 2015 10:46:50 -0700
Message-ID: <CAK5ve-KJudsMQrJjQaqQmehk0tOeQF6j6Cfc0bBECwXX19YRNg@mail.gmail.com>
References: <1426630107-25057-1-git-send-email-andrew@lunn.ch>
 <1426630107-25057-2-git-send-email-andrew@lunn.ch> <5534FA6D.4000009@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:36048 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750771AbbDTRrK (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 20 Apr 2015 13:47:10 -0400
In-Reply-To: <5534FA6D.4000009@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Matthew.Fatheree@belkin.com

On Mon, Apr 20, 2015 at 6:09 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> On 03/17/2015 11:08 PM, Andrew Lunn wrote:
>>
>> Document the binding for the TLC591xx LED driver.
>>
>> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
>> Tested-by: Imre Kaloz <kaloz@openwrt.org>
>> Cc: Matthew.Fatheree@belkin.com
>> ---
>>   .../devicetree/bindings/leds/leds-tlc591xx.txt     | 40
>> ++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
>> b/Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
>> new file mode 100644
>> index 000000000000..3bbbf7024411
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
>> @@ -0,0 +1,40 @@
>> +LEDs connected to tlc59116 or tlc59108
>> +
>> +Required properties
>> +- compatible: should be "ti,tlc59116" or "ti,tlc59108"
>> +- #address-cells: must be 1
>> +- #size-cells: must be 0
>> +- reg: typically 0x68
>> +
>> +Each led is represented as a sub-node of the ti,tlc59116.
>> +See Documentation/devicetree/bindings/leds/common.txt
>> +
>> +LED sub-node properties:
>> +- reg: number of LED line, 0 to 15 or 0 to 7
>> +- label: (optional) name of LED
>> +- linux,default-trigger : (optional)
>> +
>> +Examples:
>> +
>> +tlc59116@68 {
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +       compatible = "ti,tlc59116";
>> +       reg = <0x68>;
>> +
>> +       wan@0 {
>> +               label = "wrt1900ac:amber:wan";
>> +               reg = <0x0>;
>> +       };
>> +
>> +       2g@2 {
>> +               label = "wrt1900ac:white:2g";
>> +               reg = <0x2>;
>> +       };
>> +
>> +       alive@9 {
>> +               label = "wrt1900ac:green:alive";
>> +               reg = <0x9>;
>> +               linux,default_trigger = "heartbeat";
>> +       };
>> +};
>>
>
> Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>

Merged into my tree.
-Bryan
