From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: fix a potential NULL pointer dereference
Date: Sun, 31 Mar 2019 12:52:05 +0200
Message-ID: <1c8358dd-528a-9801-db0d-45e06cbe797f@gmail.com>
References: <20190309060411.29074-1-kjlu@umn.edu>
 <8c616b91-8f0d-f53b-af10-4d768063c5a0@gmail.com>
 <CAMuHMdXELu2tcSB5C1yKUGft6sDGPAy997ApPzy17n0MssfyWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXELu2tcSB5C1yKUGft6sDGPAy997ApPzy17n0MssfyWA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Kangjie Lu <kjlu@umn.edu>, pakki001@umn.edu, Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Linus,

Yesterday I submitted pull request [0] containing this patch, but
the patch turns out to be pointless. Since I see my pull request merged
on top of mainline trunk I suspect it will not be a problem to
drop the patch or even whole pull request. In the latter case I'll
re-submit it for -rc4.

Sorry for the confusion.

Best regards,
Jacek Anaszewski

On 3/31/19 11:06 AM, Geert Uytterhoeven wrote:
> Hi Jacek,
> 
> On Sun, Mar 10, 2019 at 9:40 PM Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
>> On 3/9/19 7:04 AM, Kangjie Lu wrote:
>>> In case of_match_device cannot find a match, the fixes returns
>>> -EINVAL to avoid NULL pointer dereference.
>>>
>>> Signed-off-by: Kangjie Lu <kjlu@umn.edu>
>>> ---
>>>    drivers/leds/leds-pca9532.c | 8 ++++++--
>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
>>> index 7fea18b0c15d..4b0335591728 100644
>>> --- a/drivers/leds/leds-pca9532.c
>>> +++ b/drivers/leds/leds-pca9532.c
>>> @@ -513,6 +513,7 @@ static int pca9532_probe(struct i2c_client *client,
>>>        const struct i2c_device_id *id)
>>>    {
>>>        int devid;
>>> +     const struct of_device_id *of_id;
>>>        struct pca9532_data *data = i2c_get_clientdata(client);
>>>        struct pca9532_platform_data *pca9532_pdata =
>>>                        dev_get_platdata(&client->dev);
>>> @@ -528,8 +529,11 @@ static int pca9532_probe(struct i2c_client *client,
>>>                        dev_err(&client->dev, "no platform data\n");
>>>                        return -EINVAL;
>>>                }
>>> -             devid = (int)(uintptr_t)of_match_device(
>>> -                     of_pca9532_leds_match, &client->dev)->data;
>>> +             of_id = of_match_device(of_pca9532_leds_match,
>>> +                             &client->dev);
>>> +             if (unlikely(!of_id))
> 
> Use of unlikey() is frowned upon.
> Moreover, this cannot happen, as pca9532_of_populate_pdata() already
> contains a similar check.
> 
> Kangjie: please stop submitting patches for missing checks, without
> investigating if the failures can actually happen. Thanks!
> 
>>> +                     return -EINVAL;
>>> +             devid = (int)of_id->data;
>>>        } else {
>>>                devid = id->driver_data;
>>>        }
>>
>>
>> Applied to the for-5.2 branch of linux-leds.git.
> 
> And also as a fix for v5.1...
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

[0] https://lkml.org/lkml/2019/3/30/222
