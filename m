From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Subject: Re: [PATCH 2/2] leds: lp5024: Add the LP5024/18 RGB LED driver
Date: Wed, 9 Jan 2019 08:20:04 +0200
Message-ID: <34e8b474-0a3e-f51b-aa8a-5b892102044d@gmail.com>
References: <8740cfd6-a6b5-ad27-313b-984a9febf18a@ti.com>
 <20181219201047.GA23448@amd> <fd624cc1-9997-1cd5-c5cc-62e6897997cf@ti.com>
 <54f28115-0a7d-8e9c-3bec-6e91fb3981ec@gmail.com>
 <cd90f179-6c16-823f-496f-27f141e9c322@ti.com>
 <a72c11c0-949b-bdbc-df2c-4490e04a1065@gmail.com>
 <986b5105-2fdb-bd25-7c8a-ca8fd1ade821@gmail.com>
 <7f205102-e854-f1cb-cc03-1307d1cddc87@gmail.com>
 <c9f8965a-90f4-b456-8225-c70694c9f071@gmail.com>
 <cf6c0025-36e7-197b-b27a-1f31fb45cc38@gmail.com> <20190104201256.GA2931@amd>
 <a4e3a782-de76-ba91-3727-4db69cf27c3a@gmail.com>
 <90a2ed79-b437-af14-4538-430d8723cc6b@gmail.com>
 <d73aa021-509d-ad34-5871-76560e868d03@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d73aa021-509d-ad34-5871-76560e868d03@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Dan,

On 07/01/2019 21.34, Dan Murphy wrote:
> Vesa
> 
> On 1/4/19 6:39 PM, Vesa Jääskeläinen wrote:
>> Hi Jacek,
>>
>> On 04/01/2019 23.37, Jacek Anaszewski wrote:
>>> But, aside from that hypothetic issue, we need a solution for
>>> LEDn_BRIGHTNESS feature of lp5024, i.e. setting color intensity
>>> via a single register write. How would you propose to address that?
>>
>> You could model it to something like this in device tree:
>>
>> led-module @ <i2c-address> {
>>      compatible = "lp5024";
>>
>>      // There is in hardware setup to use either linear or
>>      // logarithmic scaling:
>>      //enable-logarithmic-brightness;
>>
>>      led0 {
>>          // this will create led instance for LED0 in lp5024
>>          label = "lp-led0";
>>         
>>          // This specifies LED number within lp5024
>>          led-index = <0>;   // set output-base as 0*3 == 0
>>         
>>          element-red {
>>              // refers to OUT0
>>              output-offset = <0>;
>>          };
>>         
>>          element-green {
>>              // refers to OUT1
>>              output-offset = <1>;
>>          };
>>         
>>          element-blue {
>>              // refers to OUT2
>>              output-offset = <2>;
>>          };
>>         
>>      };
>>
>>      led1 {
>>          // this will create led instance for LED1 in lp5024
>>          label = "lp-led1";
>>         
>>          // This specifies LED number within lp5024
>>          led-index = <1>;   // set output-base as 1*3 == 3
>>
> 
> Can we not use led-sources like I have done already?

It was just for illustration of the idea. Names can be agreed. I have 
nothing against led-sources name. I was just looking at datasheet to try 
to undestand what it did and then tried to figure out if it could be 
mapped the idea I have been playing with.

> I really like to keep the DT nodes simple and re-use nodes that exist if possible.

I'll reply to Jacek's email about more clarifications of the idea.

Thanks,
Vesa Jääskeläinen

> My code already maps and groups the outputs into the associated banks
