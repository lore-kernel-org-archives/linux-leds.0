From: "Kim, Milo" <milo.kim@ti.com>
Subject: Re: [PATCH 04/16] Documentation: dt-bindings: leds: add LM3633 LED
 binding information
Date: Tue, 3 Nov 2015 16:05:01 +0900
Message-ID: <56385C9D.8080400@ti.com>
References: <1446440483-6948-1-git-send-email-milo.kim@ti.com>
 <1446440483-6948-2-git-send-email-milo.kim@ti.com>
 <1446440483-6948-3-git-send-email-milo.kim@ti.com>
 <1446440483-6948-4-git-send-email-milo.kim@ti.com>
 <1446440483-6948-5-git-send-email-milo.kim@ti.com>
 <CAL_Jsq+rsScGf3L0Qx+NreMpSPDNoxkYL4qeC+QCwe1F8KoRPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:40927 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751948AbbKCHFZ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 3 Nov 2015 02:05:25 -0500
In-Reply-To: <CAL_Jsq+rsScGf3L0Qx+NreMpSPDNoxkYL4qeC+QCwe1F8KoRPA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jacek Anaszewski <j.anaszewski@samsung.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>

Hi Rob,

On 11/2/2015 11:53 PM, Rob Herring wrote:
> On Sun, Nov 1, 2015 at 11:01 PM, Milo Kim <milo.kim@ti.com> wrote:
>> LM3633 LED device is one of TI LMU device list.
>>
>> Cc: devicetree@vger.kernel.org
>> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Cc: Lee Jones <lee.jones@linaro.org>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-leds@vger.kernel.org
>> Signed-off-by: Milo Kim <milo.kim@ti.com>
>> ---
>>   .../devicetree/bindings/leds/leds-lm3633.txt       | 28 ++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3633.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3633.txt b/Documentation/devicetree/bindings/leds/leds-lm3633.txt
>> new file mode 100644
>> index 0000000..bb7f213
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-lm3633.txt
>> @@ -0,0 +1,28 @@
>> +TI LMU LM3633 LED device tree bindings
>> +
>> +Required properties:
>> +  - compatible: "ti,lm3633-leds"
>> +
>> +Child nodes:
>> +  Each node matches with LED control bank.
>> +  Please refer to the datasheet [1].
>> +
>> +  Required properties of a child node:
>> +  - lvled1-used, lvled2-used, lvled3-used,
>> +    lvled4-used, lvled5-used, lvled6-used:
>> +    Low voltage LED string configuration. Type is <boolean>.
>> +    Please describe which output LED string is used.
>
> What is "LED string"?

Let me replace these properties with 'led-sources'.

>
> We have properties for which LED driver/channel of the parent to use
> and "status" can be used to disable child nodes.
>
>> +
>> +  Optional properties of a child node:
>> +  - channel-name: Name string for LED channel identification
>> +                  It is used for creating LED sysfs,
>> +                  /sys/class/leds/<channel-name>/.
>> +                  If this property is empty, then default name is set to
>> +                  "indicator:<id>" by the driver.
>
> I believe "label" already provides this function.
>

Yep, got it. Thanks!

Best regards,
Milo
