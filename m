From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC PATCH 5/5] leds: multicolor: Introduce a multicolor class
 definition
Date: Tue, 2 Apr 2019 06:55:37 -0500
Message-ID: <262bf73c-3fef-a5cb-3dd7-3312dae059d9@ti.com>
References: <20190401173400.14238-1-dmurphy@ti.com>
 <20190401173400.14238-6-dmurphy@ti.com> <20190402074406.0860994a@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402074406.0860994a@nic.cz>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Behun <marek.behun@nic.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Marek

On 4/2/19 12:44 AM, Marek Behun wrote:
> Hi Dan,
> 
> On Mon, 1 Apr 2019 12:34:00 -0500
> Dan Murphy <dmurphy@ti.com> wrote:
> 
>> +static ssize_t sync_store(struct device *dev,
>> +			  struct device_attribute *sync_attr,
>> +			  const char *buf, size_t size)
>> +{
>> +	struct led_classdev_mc_data *data = container_of(sync_attr,
>> +						      struct led_classdev_mc_data,
>> +						      sync_attr);
>> +	struct led_classdev_mc *mcled_cdev = data->mcled_cdev;
>> +	struct led_classdev *led_cdev = &mcled_cdev->led_cdev;
>> +	const struct led_multicolor_ops *ops = mcled_cdev->ops;
>> +	struct led_classdev_mc_priv *priv;
>> +	unsigned long sync_value;
>> +	ssize_t ret = -EINVAL;
>> +
>> +	mutex_lock(&led_cdev->led_access);
>> +
>> +	if (!mcled_cdev->sync_enabled)
>> +		goto unlock;
> 
> This lock is redundant, you could just put
>   if (mcled_cdev->sync_enabled)
>     return ret;
> before the lock.
> 

Ack

Thanks the code is just proof of concept code.  But I will make this change as well.

Dan

-- 
------------------
Dan Murphy
