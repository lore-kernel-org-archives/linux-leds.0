From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC PATCH 2/5] dt: bindings: Add multicolor class dt bindings
 documention
Date: Tue, 2 Apr 2019 12:06:52 -0500
Message-ID: <c6abe495-d7fe-a784-0b9b-1c690b01e008@ti.com>
References: <20190401173400.14238-1-dmurphy@ti.com>
 <20190401173400.14238-3-dmurphy@ti.com> <20190401212921.GB14681@amd>
 <f8655180-0c3a-7292-3a49-57d997473992@ti.com>
 <20190402181712.3eccdb4b@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402181712.3eccdb4b@nic.cz>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Behun <marek.behun@nic.cz>
Cc: Pavel Machek <pavel@ucw.cz>, robh+dt@kernel.org, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
List-Id: linux-leds@vger.kernel.org

Marek

On 4/2/19 11:17 AM, Marek Behun wrote:
> On Tue, 2 Apr 2019 06:40:53 -0500
> Dan Murphy <dmurphy@ti.com> wrote:
> 
>> I have had off line conversations with Jacek about this brightness model node.
>>
>> Your concern was actually one of my concerns as well.  Not only millions of entries but also having a huge
>> DT binary.
>>
>> We wanted to RFC this to get feedback.  And this is why I have not added any support for this in the framework code.
>>
>> Dan
>>
> 
> What if we just stuck to color spaces and defined channel curves in the
> device tree?
> 

Vesa did a good summary of the current MC framework implementations that are being proposed
The thread also documents Pavel's requirements

https://lore.kernel.org/patchwork/patch/1037147/

And here is the series with a single brightness file and passing in multiple integers.
I did not document this code as I was pretty certain it was not the way to go.

https://patches.linaro.org/project/linux-leds/list/?series=18022

Dan

> The curve could then be defined via an array of integer pairs, which
> would be interpreted as points via which the curve passes and the curve
> would be approximated by linear segemts...
> 
>   led@0 {
>     colorspace = <COLOR_SPACE_ID_RGB>;
>     red-curve = <0 0>, <255 255>;
>     green-curve = <0 0>, <255 128>;
>     blue-curve = <0 0>, <255 128>;
>   };
> 


-- 
------------------
Dan Murphy
