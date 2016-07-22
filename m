From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v6 2/2] Bindings documentation for ISSI is31fl319x driver
Date: Fri, 22 Jul 2016 08:36:35 +0200
Message-ID: <5791BEF3.5060404@samsung.com>
References: <cover.1468928850.git.hns@goldelico.com>
 <403335d22f6a8e131bc44077f97e499970e61245.1468928850.git.hns@goldelico.com>
 <20160720012457.GA10971@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20160720012457.GA10971@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, drivshin.allworx@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org, Andrey Utkin <andrey_utkin@fastmail.com>
List-Id: linux-leds@vger.kernel.org

On 07/20/2016 03:24 AM, Rob Herring wrote:
> On Tue, Jul 19, 2016 at 01:47:31PM +0200, H. Nikolaus Schaller wrote:
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>   .../devicetree/bindings/leds/is31fl319x.txt        | 59 ++++++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/is31fl319x.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/is31fl319x.txt b/Documentation/devicetree/bindings/leds/is31fl319x.txt
>> new file mode 100644
>> index 0000000..03287c0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/is31fl319x.txt
>> @@ -0,0 +1,59 @@
>> +LEDs connected to is31fl319x LED controller chip
>> +
>> +Required properties:
>> +- compatible : Should be any of
>> +	"issi,is31fl3190"
>> +	"issi,is31fl3191"
>> +	"issi,is31fl3193"
>> +	"issi,is31fl3196"
>> +	"issi,is31fl3199"
>> +	"si-en,sn3199".
>> +- #address-cells: Must be 1.
>> +- #size-cells: Must be 0.
>> +- reg: 0x64, 0x65, 0x66, 0x67.
>
> This is an OR or AND? OR it seems. With that,

Nikolaus, could you please make it explicit?

>
> Acked-by: Rob Herring <robh@kernel.org>
>
>


-- 
Best regards,
Jacek Anaszewski
