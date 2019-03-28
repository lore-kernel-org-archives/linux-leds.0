From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 00/25] Add generic support for composing LED class
 device name
Date: Thu, 28 Mar 2019 21:54:49 +0100
Message-ID: <46cf838b-ae41-4c0e-ba73-9a55b0ca03c0@gmail.com>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
 <20190328001930.GA22901@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328001930.GA22901@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz
List-Id: linux-leds@vger.kernel.org

On 3/28/19 1:19 AM, Rob Herring wrote:
> On Sun, Mar 10, 2019 at 07:28:11PM +0100, Jacek Anaszewski wrote:
>> Changes from v1:
>>
>> - improved led_parse_properties() to parse label property at first
>>    and return immediately after parsing succeeds
>> - added tool get_led_device_info.sh for retrieving LED class device's
>>    parent device related information
>> - extended LED naming section of Documentation/leds/leds-class.txt
>> - adjusted the list of LED_FUNCTION definitions according to the v1 review
>>    remarks
>> - added standard LED_COLOR_NAME definitions
>> - removed functions.h and moved both LED_FUNCTION and LED_COLOR_NAME
>>    definitions to include/dt-bindings/common.h
>> - rebased leds-as3645a changes on top of the patch switching to fwnode
>>    property API
>> - updated DT bindings to use new LED_COLOR_NAME definitions
>> - improved common LED bindings to not use address unit for sub-nodes
>>    without reg property
>>
>> Generally I still insist on deprecating label property and devicename
>> section of LED name. The tool I added for obtaining LED device name
>> proves availability of the related information in other places in
>> the sysfs. Other discussed use cases are covered in the updated
>> Documentation/leds/leds-class.txt.
>>
>> Beside that, I tried also to create macros for automatic composition
>> of "-N" suffixed LED functions, so that it would not be necessary
>> to pollute common.h with plenty repetitions of the same function,
>> differing only with the postfix. Unfortunately, the preprocessor
>> of the dtc compiler seems not to accept string concatenetation.
>> I.e. it is not possible to to the following assighment:
>>
>> function = "hdd""-1"
>>
>> If anyone knows how to obviate this shortocoming please let me know.
> 
> Raise the question on devicetree-compiler list. I've done my share of
> dtc patches, but the parsing side is generally not an area I touch.

I'll probably come up with additional property function-enumerator.

-- 
Best regards,
Jacek Anaszewski
