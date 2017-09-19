From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH v2 4/6] dt: bindings: as3645a: Improve label
 documentation, DT example
Date: Tue, 19 Sep 2017 23:01:02 +0200
Message-ID: <809f7590-7641-e8bc-c009-4fed05d5827c@gmail.com>
References: <20170918102349.8935-1-sakari.ailus@linux.intel.com>
 <20170918102349.8935-5-sakari.ailus@linux.intel.com>
 <20170918105655.GA14591@amd>
 <20170918144923.dnhrxkirle3fvdfo@valkosipuli.retiisi.org.uk>
 <20170918205407.GA1849@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170918205407.GA1849@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 09/18/2017 10:54 PM, Pavel Machek wrote:
> On Mon 2017-09-18 17:49:23, Sakari Ailus wrote:
>> Hi Pavel,
>>
>> On Mon, Sep 18, 2017 at 12:56:55PM +0200, Pavel Machek wrote:
>>> Hi!
>>>
>>>> Specify the exact label used if the label property is omitted in DT, as
>>>> well as use label in the example that conforms to LED device naming.
>>>>
>>>> @@ -69,11 +73,11 @@ Example
>>>>  			flash-max-microamp = <320000>;
>>>>  			led-max-microamp = <60000>;
>>>>  			ams,input-max-microamp = <1750000>;
>>>> -			label = "as3645a:flash";
>>>> +			label = "as3645a:white:flash";
>>>>  		};
>>>>  		indicator@1 {
>>>>  			reg = <0x1>;
>>>>  			led-max-microamp = <10000>;
>>>> -			label = "as3645a:indicator";
>>>> +			label = "as3645a:red:indicator";
>>>>  		};
>>>>  	};
>>>
>>> Ok, but userspace still has no chance to determine if this is flash
>>> from main camera or flash for front camera; todays smartphones have
>>> flashes on both cameras.
>>>
>>> So.. Can I suggset as3645a:white:main_camera_flash or main_flash or
>>> ....?
>>
>> If there's just a single one in the device, could you use that?
>>
>> Even if we name this so for N9 (and N900), the application still would only
>> work with the two devices.
> 
> Well, I'd plan to name it on other devices, too.
> 
>> My suggestion would be to look for a flash LED, and perhaps the maximum
>> current as well. That should generally work better than assumptions on the
>> label.
> 
> If you just look for flash LED, you don't know if it is front one or
> back one. Its true that if you have just one flash it is usually on
> the back camera, but you can't know if maybe driver is not available
> for the main flash.
> 
> Lets get this right, please "main_camera_flash" is 12 bytes more than
> "flash", and it saves application logic.. more than 12 bytes, I'm sure. 

What you are trying to introduce is yet another level of LED class
device naming standard, one level below devicename:colour:function.
It seems you want also to come up with the set of standarized LED
function names. This would certainly have to be covered for consistency.

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
