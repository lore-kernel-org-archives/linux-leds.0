From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 04/24] dt-bindings: leds: Add function and color
 properties
Date: Thu, 8 Nov 2018 21:47:55 +0100
Message-ID: <c650a9eb-afae-2a27-e39c-d448a5b3eadd@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-5-git-send-email-jacek.anaszewski@gmail.com>
 <26714494-06f8-163d-1ef8-75f75c25a467@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <26714494-06f8-163d-1ef8-75f75c25a467@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-Id: linux-leds@vger.kernel.org

Dan,

On 11/08/2018 07:00 PM, Dan Murphy wrote:
> Jacek
> 
> On 11/06/2018 04:07 PM, Jacek Anaszewski wrote:
>> Introduce dedicated properties for conveying information about
>> LED function and color. Mark old "label" property as deprecated.
>>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Cc: Baolin Wang <baolin.wang@linaro.org>
>> Cc: Daniel Mack <daniel@zonque.org>
>> Cc: Dan Murphy <dmurphy@ti.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Oleh Kravchenko <oleg@kaa.org.ua>
>> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Cc: Simon Shields <simon@lineageos.org>
>> Cc: Xiaotong Lu <xiaotong.lu@spreadtrum.com>
>> ---
>>  Documentation/devicetree/bindings/leds/common.txt | 52 +++++++++++++++++++----
>>  1 file changed, 44 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
>> index aa13998..3efc826 100644
>> --- a/Documentation/devicetree/bindings/leds/common.txt
>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>> @@ -10,14 +10,20 @@ can influence the way of the LED device initialization, the LED components
>>  have to be tightly coupled with the LED device binding. They are represented
>>  by child nodes of the parent LED device binding.
>>  
>> +
>>  Optional properties for child nodes:
>>  - led-sources : List of device current outputs the LED is connected to. The
>>  		outputs are identified by the numbers that must be defined
>>  		in the LED device binding documentation.
>> +- function: LED functon. Use one of the LED_FUNCTION_* prefixed definitions
>> +	    from the header include/dt-bindings/leds/functions.h.
>> +	    If there is no matching LED_FUNCTION available, add a new one.
>> +- color : Color of the LED.
> 
> Should we define the colors too?  There are only really 4.  Red, green, blue and white.
> 
> Generally varying colors are created base on the primary colors.  Even the amber color

No problem, I can add LED colors. However, I don't quite follow how
the mix of base color strings would give "amber" ? :-)

-- 
Best regards,
Jacek Anaszewski
