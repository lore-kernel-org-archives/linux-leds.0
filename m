From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH -next] leds: mlxcpld: fix return value check in
 mlxcpld_led_init()
Date: Wed, 14 Sep 2016 10:56:08 +0200
Message-ID: <20ec6414-644c-88a7-81df-95b36326b347@samsung.com>
References: <CGME20160913145849eucas1p1c1661ef621a39d2955b29710a3729e7b@eucas1p1.samsung.com>
 <1473778715-11283-1-git-send-email-weiyj.lk@gmail.com>
 <e5b6b992-4881-3e7d-5904-a7d690c9e66d@samsung.com>
 <6AADFAC011213A4C87B956458587ADB46B9952@SZXEMI508-MBX.china.huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:16910 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755993AbcINI4O (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Sep 2016 04:56:14 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ODH006UGKTMYP30@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 14 Sep 2016 09:56:10 +0100 (BST)
In-reply-to: <6AADFAC011213A4C87B956458587ADB46B9952@SZXEMI508-MBX.china.huawei.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "weiyongjun (A)" <weiyongjun1@huawei.com>, Wei Yongjun <weiyj.lk@gmail.com>, Vadim Pasternak <vadimp@mellanox.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On 09/14/2016 09:10 AM, weiyongjun (A) wrote:
> Hi Jacek,
>
>> -----Original Message-----
>> From: Jacek Anaszewski [mailto:j.anaszewski@samsung.com]
>> Sent: Wednesday, September 14, 2016 2:56 PM
>> To: Wei Yongjun; Vadim Pasternak; Richard Purdie
>> Cc: weiyongjun (A); linux-leds@vger.kernel.org
>> Subject: Re: [PATCH -next] leds: mlxcpld: fix return value check in
>> mlxcpld_led_init()
>>
>> Hi Wei,
>>
>>
>> Thanks for your patches. Would you mind if I merged them to the
>> original patch and added your Reviewed-by tag to the commit message?
>
> Feel free to merge them, it is ok with me.

Patches merged. I added also to the commit message the tag:

Reviewed-by: Wei Yongjun <weiyongjun1@huawei.com>

-- 
Best regards,
Jacek Anaszewski
