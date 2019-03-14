From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 1/4] leds: netdev trigger: use memcpy in device_name_store
Date: Thu, 14 Mar 2019 11:54:06 +0100
Message-ID: <9324dc3c-a9dd-e179-6fc5-17b2fdaab74b@rasmusvillemoes.dk>
References: <20190311144227.GA4404@amd>
 <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190313202615.22883-2-linux@rasmusvillemoes.dk>
 <20190314101419.GA14455@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314101419.GA14455@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 14/03/2019 11.14, Pavel Machek wrote:
> Hi!
> 
>> If userspace doesn't end the input with a newline (which can easily
>> happen if the write happens from a C program that does write(fd,
>> iface, strlen(iface))), we may end up including garbage from a
>> previous, longer value in the device_name. For example
>>
>> # cat device_name
>>
>> # printf 'eth12' > device_name
>> # cat device_name
>> eth12
>> # printf 'eth3' > device_name
>> # cat device_name
>> eth32
>>
>> I highly doubt anybody is relying on this behaviour, so switch to
>> simply copying the bytes (we've already checked that size is <
>> IFNAMSIZ) and unconditionally zero-terminate it; of course, we also
>> still have to strip a trailing newline.
> 
>   char device_name[IFNAMSIZ];
> 
> Ok, good catch reporting the bug, but are you sure the fix is right?
> 
> AFAICT the design is that device_name does _not_ have to be zero
> terminated, and your fix incorrectly limits the size of device_name.

Yes, I'm sure.

/**
 *      dev_valid_name - check if name is okay for network device
 *      @name: name string
 *
 *      Network device names need to be valid file names to
 *      to allow sysfs to work.  We also disallow any kind of
 *      whitespace.
 */
bool dev_valid_name(const char *name)
{
        if (*name == '\0')
                return false;
        if (strnlen(name, IFNAMSIZ) == IFNAMSIZ)
                return false;

so no netdevice name has a string length > 15 (IOW, there must be a nul
byte within the first 16 bytes of name). Also note all the places a
net_device->name is printed with a simple %s, so they are definitely
always 0-terminated.

Moreover, I'm actually not limiting anything more than was already done;
we already reject any input from userspace >= 16 bytes. I'm simply
ensuring that we're never confused by leftover garbage.

>> --- a/drivers/leds/trigger/ledtrig-netdev.c
>> +++ b/drivers/leds/trigger/ledtrig-netdev.c
>> @@ -122,7 +122,8 @@ static ssize_t device_name_store(struct device *dev,
>>  		trigger_data->net_dev = NULL;
>>  	}
>>  
>> -	strncpy(trigger_data->device_name, buf, size);
>> +	memcpy(trigger_data->device_name, buf, size);
>> +	trigger_data->device_name[size] = '\0';
> 
> I'd do = 0 for consistency with code below.

I'd rather the other way around :) but yeah, let's just be consistent.
I'll fix in next version.

> I believe the strncpy() is right to use here, but code should be
> modified so that zero-termination is not required.

So, I believe the above should convince you that strncpy is wrong. Or
rather, strncpy is really just a convoluted memcpy: the userspace input
doesn't contain a nul among the size bytes [1], so the "copy all the
bytes, but don't nul-terminate" semantics of strncpy kick in - which is
often a security bug, but the code is such that the zero at
device_name[15] (because it was originally kzalloc'ed) is never
overwritten. So in theory, we could keep strncpy and just add the
nul-termination, but the str* prefix is very misleading (which is
probably why the bug happened in the first place).

[1] And if it did, the "zero the rest of the output buffer" semantics
kick in. That's functionally equivalent to my memcpy() + write one nul
byte, since nothing after that first nul byte in device_name would ever
be inspected.

Rasmus
