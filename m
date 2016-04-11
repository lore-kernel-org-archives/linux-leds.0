From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH 1/1] leds: pca9532: Add device tree binding
Date: Mon, 11 Apr 2016 14:17:18 +0800
Message-ID: <570B416E.7020507@electromag.com.au>
References: <1459912250-50878-1-git-send-email-preid@electromag.com.au>
 <1459912250-50878-2-git-send-email-preid@electromag.com.au>
 <20160407175755.GN32257@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from anchovy2.45ru.net.au ([203.30.46.146]:35007 "EHLO
	anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750801AbcDKGR3 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 11 Apr 2016 02:17:29 -0400
In-Reply-To: <20160407175755.GN32257@rob-hp-laptop>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, riku.voipio@iki.fi, rpurdie@rpsys.net, j.anaszewski@samsung.com, devicetree@vger.kernel.org, linux-leds@vger.kernel.org

On 8/04/2016 1:57 AM, Rob Herring wrote:
> On Wed, Apr 06, 2016 at 11:10:50AM +0800, Phil Reid wrote:
>> This patch adds basic device tree support for the pca9532 LEDs.
>>
>> Signed-off-by: Phil Reid <preid@electromag.com.au>
>> ---
>>   .../devicetree/bindings/leds/leds-pca9532.txt      | 32 +++++++++++
>>   drivers/leds/leds-pca9532.c                        | 63 ++++++++++++++++++++--
>>   include/dt-bindings/leds/leds-pca9532.h            | 18 +++++++
>>   include/linux/leds-pca9532.h                       |  8 ++-
>>   4 files changed, 112 insertions(+), 9 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-pca9532.txt
>>   create mode 100644 include/dt-bindings/leds/leds-pca9532.h
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.txt b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
>> new file mode 100644
>> index 0000000..b48c223
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
>
> Would leds-pca953x.txt be more appropriate.
I have no objection. I just followed the driver file name.
Other disucssions seem to indicate the preference to move away from
the 'x' in driver names and just use one of the devices for the name.
Note that there is a gpio-pca953x driver.
Which support pca9534-9539 plus other gpio devices.
Those devices don't have the same functionality as this series.

>
>> @@ -0,0 +1,32 @@
>> +*NXP - pca9532 PWM LED Driver
>> +
>> +The PCA9532 family is SMBus I/O expander optimized for dimming LEDs.
>> +The PWM support 256 steps.
>
> supports
>
>> +
>> +Required properties:
>> +	- compatible:
>> +		"nxp,pca9530"
>> +		"nxp,pca9531"
>> +		"nxp,pca9532"
>> +		"nxp,pca9533"
>> +	- reg -  I2C slave address
>> +
>> +Each led is represented as a sub-node of the nxp,pca9530.
>> +
>> +LED sub-node properties:
>
> What are sub-node names and how many?
They don't seem to be important. It's a fallback for when label isn't defined.
I just following leds-netxbig.txt

>
>> +- type: Output configuration
>> +	0 = NONE, 1 = LED, 2 = N2100_BEEP, 3 = GPIO
>
> Add vendor prefix.
Done.
>
>> +
>> +Example:
>> +
>> +  ledBL: pca9530@60 {
>> +    compatible = "nxp,pca9530";
>> +    reg = <0x60>;
>> +
>> +    led0 {
>> +      type = <PCA9532_TYPE_LED>;
>> +    };
>> +  };
>> +
>> +For more product information please see the link below:
>> +http://nxp.com/documents/data_sheet/PCA9532.pdf
>
> Move this up to the top.
Done, but note this doesn't follow the layout of other files in the folder.


-- 
Regards
Phil Reid
