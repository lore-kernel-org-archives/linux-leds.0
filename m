From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v3] leds: Introduce userspace leds driver
Date: Fri, 16 Sep 2016 10:41:20 -0500
Message-ID: <a3a5c492-3c9a-9fd6-a601-c4fd6bcd3106@lechnology.com>
References: <1473439776-15655-1-git-send-email-david@lechnology.com>
 <CGME20160912081846eucas1p255044e49034685ad44400d6830ef0b95@eucas1p2.samsung.com>
 <80597ded-f4b4-2990-3eae-e72276296d1a@samsung.com>
 <20160915130831.GJ13132@amd>
 <313cbae5-fd66-f0ae-79a9-a3f4273d6f9c@samsung.com>
 <d3f1810c-e97a-4460-1415-f54e8501cf64@lechnology.com>
 <20160916060718.GD13205@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vern.gendns.com ([206.190.152.46]:36723 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1760234AbcIPPlV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Sep 2016 11:41:21 -0400
In-Reply-To: <20160916060718.GD13205@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>

On 09/16/2016 01:07 AM, Pavel Machek wrote:
> Hi!
>
> +static ssize_t uleds_read(struct file *file, char __user *buffer,
> size_t count,
> + loff_t *ppos)
> +{
> + struct uleds_device *udev = file->private_data;
> + ssize_t retval;
> +
> + if (count == 0)
> + return 0;
> +
> + if (count != 1)
> + return -EINVAL;
>
> This is quite anti-social. You are free to return 1 byte on any read
> (short read), but please allow reads with bigger buffers.
>
> Thanks,
> 									Pavel
>

Sure.
