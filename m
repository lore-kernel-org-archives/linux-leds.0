From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v3] leds: Introduce userspace leds driver
Date: Thu, 15 Sep 2016 16:54:26 +0200
Message-ID: <313cbae5-fd66-f0ae-79a9-a3f4273d6f9c@samsung.com>
References: <1473439776-15655-1-git-send-email-david@lechnology.com>
 <CGME20160912081846eucas1p255044e49034685ad44400d6830ef0b95@eucas1p2.samsung.com>
 <80597ded-f4b4-2990-3eae-e72276296d1a@samsung.com> <20160915130831.GJ13132@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20160915130831.GJ13132@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: David Lechner <david@lechnology.com>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 09/15/2016 03:08 PM, Pavel Machek wrote:
> Hi!
>
>>> +	if (copy_from_user(&udev->user_dev, buffer,
>>> +			   sizeof(struct uleds_user_dev))) {
>>> +		ret = -EFAULT;
>>> +		goto out;
>>> +	}
>>> +
>>> +	if (!udev->user_dev.name[0]) {
>>> +		ret = -EINVAL;
>>> +		goto out;
>>> +	}
>>> +
>>> +	ret = led_classdev_register(NULL, &udev->led_cdev);
>>> +	if (ret < 0)
>>> +		goto out;
>
> No sanity checking on the name -> probably a security hole. Do not
> push this upstream before this is fixed.

Thanks for catching this.

David, please check if the LED name sticks to the LED class
device naming convention.

And one thing that caught my eye only now - please use
devm_led_classdev_register().

For now I'm dropping the patch.

-- 
Best regards,
Jacek Anaszewski
