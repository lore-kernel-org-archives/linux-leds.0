From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v3] leds: Introduce userspace leds driver
Date: Thu, 15 Sep 2016 10:35:45 -0500
Message-ID: <136972ae-2bc7-9621-dfe5-75f29f6c02d4@lechnology.com>
References: <1473439776-15655-1-git-send-email-david@lechnology.com>
 <CGME20160912081846eucas1p255044e49034685ad44400d6830ef0b95@eucas1p2.samsung.com>
 <80597ded-f4b4-2990-3eae-e72276296d1a@samsung.com>
 <20160915130831.GJ13132@amd>
 <313cbae5-fd66-f0ae-79a9-a3f4273d6f9c@samsung.com>
 <d3f1810c-e97a-4460-1415-f54e8501cf64@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vern.gendns.com ([206.190.152.46]:49833 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750922AbcIOPfq (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 15 Sep 2016 11:35:46 -0400
In-Reply-To: <d3f1810c-e97a-4460-1415-f54e8501cf64@lechnology.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>

On 09/15/2016 10:31 AM, David Lechner wrote:

>
> How do I use devm_* when there is no parent device?
>
>

Answering my own question. I seen now that struct miscdevice has struct 
device that should be used as the parent.
