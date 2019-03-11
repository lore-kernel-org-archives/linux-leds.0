From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH] leds: fix a potential NULL pointer dereference
Date: Mon, 11 Mar 2019 11:09:08 +0100
Message-ID: <32c84850-85e8-e063-b104-220afe0554f8@metux.net>
References: <20190309060411.29074-1-kjlu@umn.edu>
 <8c616b91-8f0d-f53b-af10-4d768063c5a0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8c616b91-8f0d-f53b-af10-4d768063c5a0@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Kangjie Lu <kjlu@umn.edu>
Cc: pakki001@umn.edu, Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 10.03.19 21:27, Jacek Anaszewski wrote:
> Hi Kangjie,
> 
> Thank you for the patch.
> 
> On 3/9/19 7:04 AM, Kangjie Lu wrote:
>> In case of_match_device cannot find a match, the fixes returns
>> -EINVAL to avoid NULL pointer dereference.
>>
>> Signed-off-by: Kangjie Lu <kjlu@umn.edu>
>> ---
>>   drivers/leds/leds-pca9532.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
>> index 7fea18b0c15d..4b0335591728 100644
>> --- a/drivers/leds/leds-pca9532.c
>> +++ b/drivers/leds/leds-pca9532.c
>> @@ -513,6 +513,7 @@ static int pca9532_probe(struct i2c_client *client,
>>       const struct i2c_device_id *id)
>>   {
>>       int devid;
>> +    const struct of_device_id *of_id;

Looks like an indention mismatch that might call for the
Great White Handkerchief ;-)


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
