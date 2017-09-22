From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v3 0/4] AS3645A fixes
Date: Sat, 23 Sep 2017 00:25:39 +0300
Message-ID: <076725cc-ef46-898d-34e5-099ece5d50b4@linux.intel.com>
References: <20170922093238.13070-1-sakari.ailus@linux.intel.com>
 <650b7cb3-f7dd-5959-3147-df7284415521@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <650b7cb3-f7dd-5959-3147-df7284415521-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

(Fixed DT list address.)

Jacek Anaszewski wrote:
> Hi Sakari,
>
> On 09/22/2017 11:32 AM, Sakari Ailus wrote:
>> Hi Jacek and others,
>>
>> Here are a few fixes for the as3645a DTS as well as changes in bindings.
>> The driver is not in a release yet.
>>
>> Jacek: Could you take these to your fixes branch so we don't get faulty DT
>> bindings to a release? I've dropped the patches related to LED naming and
>> label property as the discusion appears to continue on that.
>
> No problem. One question - isn't patch 3/4 missing?

Hmm. I can see it on both linux-leds and devicetree.

I've pushed the four patches here, on v4.14-rc1:

<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=as3645a-fix>

-- 
Sakari Ailus
sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
