From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v8 8/8] DT: samsung-fimc: Add examples for
 samsung,flash-led property
Date: Mon, 25 May 2015 14:50:52 +0200
Message-ID: <55631AAC.6080507@samsung.com>
References: <1432131015-22397-1-git-send-email-j.anaszewski@samsung.com>
 <1432131015-22397-9-git-send-email-j.anaszewski@samsung.com>
 <20150520220018.GE8601@valkosipuli.retiisi.org.uk>
 <555DA119.9030904@samsung.com>
 <20150521113213.GI8601@valkosipuli.retiisi.org.uk>
 <555DDD88.8080601@samsung.com>
 <20150523120348.GA3170@valkosipuli.retiisi.org.uk> <55630EE1.90307@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <55630EE1.90307@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, devicetree@vger.kernel.org, sre@kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 05/25/2015 02:00 PM, Sylwester Nawrocki wrote:
> Hi,
>
> On 23/05/15 14:03, Sakari Ailus wrote:
>> On Thu, May 21, 2015 at 03:28:40PM +0200, Sylwester Nawrocki wrote:
>>> flash-leds = <&flash_xx &image_sensor_x>, <...>;
>>
>> One more matter to consider: xenon flash devices.
>>
>> How about samsung,camera-flashes (and ti,camera-flashes)? After pondering
>> this awhile, I'm ok with removing the vendor prefix as well.
>>
>> Let me know what you think.
>
> I thought about it a bit more and I have some doubts about semantics
> as above. I'm fine with 'camera-flashes' as far as name is concerned.
>
> Perhaps we should put only phandles to leds or xenon flash devices
> in the 'camera-flashes' property. I think it would be more future
> proof in case there is more nodes needed to describe the camera flash
> (or a camera module) than the above two. And phandles to corresponding
> image sensor device nodes would be put in a separate property.

Could you give examples of the cases you are thinking of?

> camera-flashes = <&flash_xx>, ...
> camera-flash-masters = <&image_sensor_x>, ...
>
> Then pairs at same index would describe a single flash, 0 would indicate
> a null entry if needed.

When it should be needed?

> Similarly we could create properties for other sub-devices of a camera
> module, like lenses, etc.


-- 
Best Regards,
Jacek Anaszewski
