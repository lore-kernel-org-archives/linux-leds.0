From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 1/9] leds: multicolor: Add sysfs interface definition
Date: Tue, 28 May 2019 13:19:12 -0500
Message-ID: <e54d9d29-5daa-fd3a-a5a9-ebd2450882ee@ti.com>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-2-dmurphy@ti.com>
 <f01ac400-efda-80a8-4d63-1e2add5e054a@gmail.com>
 <185abdd6-100c-0a71-2da9-8f556d8ea701@ti.com>
 <333167d0-4615-2fbe-e933-cbca623998ef@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <333167d0-4615-2fbe-e933-cbca623998ef@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, pavel@ucw.cz, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Jacek

On 5/28/19 12:44 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 5/28/19 7:32 PM, Dan Murphy wrote:
>> Jacek
>>
>> On 5/27/19 3:00 PM, Jacek Anaszewski wrote:
>>> Hi Dan,
>>>
>>> Thank you for the update.
>>>
>>> One thing is missing here - we need to document how legacy brightness
>>> levels map to the sub-LED color levels, i.e. what you do in
>>> multicolor_set_brightness().
>>
>>
>> Ok so i will need to document the algorithm that is used to determine 
>> the color LED brightness.
>
> Right, and please send just an update of that single patch.
>

So you are asking for v4 with only this patch updated.


Dan
