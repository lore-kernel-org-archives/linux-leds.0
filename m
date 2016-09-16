From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v3] leds: Introduce userspace leds driver
Date: Fri, 16 Sep 2016 09:07:45 +0200
Message-ID: <b7c3ce51-e232-5dea-b413-f01bea59cc84@samsung.com>
References: <1473439776-15655-1-git-send-email-david@lechnology.com>
 <CGME20160912081846eucas1p255044e49034685ad44400d6830ef0b95@eucas1p2.samsung.com>
 <80597ded-f4b4-2990-3eae-e72276296d1a@samsung.com>
 <20160915130831.GJ13132@amd>
 <313cbae5-fd66-f0ae-79a9-a3f4273d6f9c@samsung.com>
 <a3496eea-dc5d-b9c7-bfa4-19b8f004d5ee@lechnology.com>
 <20160916055014.GA13205@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33541 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755380AbcIPHHx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Sep 2016 03:07:53 -0400
In-reply-to: <20160916055014.GA13205@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, David Lechner <david@lechnology.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>

On 09/16/2016 07:50 AM, Pavel Machek wrote:
> Hi!
>
>>>>>> +    if (copy_from_user(&udev->user_dev, buffer,
>>>>>> +               sizeof(struct uleds_user_dev))) {
>>>>>> +        ret = -EFAULT;
>>>>>> +        goto out;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (!udev->user_dev.name[0]) {
>>>>>> +        ret = -EINVAL;
>>>>>> +        goto out;
>>>>>> +    }
>>>>>> +
>>>>>> +    ret = led_classdev_register(NULL, &udev->led_cdev);
>>>>>> +    if (ret < 0)
>>>>>> +        goto out;
>>>>
>>>> No sanity checking on the name -> probably a security hole. Do not
>>>> push this upstream before this is fixed.
>>>
>>
>> If this is a serious security issue, then you should also raise an issue
>> with input maintainers because this is the extent of sanity checking for
>> uinput device names as well.
>
> I guess that should be fixed. But lets not add new ones.
>
>> I must confess that I am no security expert, so unless you can give specific
>> examples of what potential threats are, I will not be able to guess what I
>> need to do to fix it.
>>
>> After some digging around the kernel, I don't see many instances of
>> validating device node names. The best I have found so far comes from
>> create_entry() in binfmt_misc.c
>>
>> 	if (!e->name[0] ||
>> 	    !strcmp(e->name, ".") ||
>> 	    !strcmp(e->name, "..") ||
>> 	    strchr(e->name, '/'))
>> 		goto einval;
>>
>> Would something like this be a sufficient sanity check? I suppose we could
>> also check for non-printing characters, but I don't think ignoring them
>> would be a security issue.
>
> That would be minimum, yes. I guess it would be better/easier to just
> limit the names to [a-zA-Z:-_0-9]*?

Right, and we also could check if there are no more then two ":"
characters in the name.

-- 
Best regards,
Jacek Anaszewski
