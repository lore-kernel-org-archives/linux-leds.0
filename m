From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 0/4] LED trigger on MTD activity
Date: Thu, 14 Apr 2016 09:45:53 +0200
Message-ID: <570F4AB1.2020600@samsung.com>
References: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570E0506.4040705@samsung.com> <20160413203905.06371b4c@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:62897 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752453AbcDNHp5 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 14 Apr 2016 03:45:57 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O5M001SS5KI3F70@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 14 Apr 2016 08:45:54 +0100 (BST)
In-reply-to: <20160413203905.06371b4c@bbrezillon>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-mtd@lists.infradead.org, linux-leds@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>

Hi Boris,

On 04/13/2016 08:39 PM, Boris Brezillon wrote:
> Hi Jacek,
>
> On Wed, 13 Apr 2016 10:36:22 +0200
> Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
>
>> Hi Ezequiel,
>>
>> Thanks for the update. From the previous discussion I've inferred
>> that it has been agreed on the whole patch to go through the LED tree.
>>
>> Applied whole patch set to the for-next branch of linux-leds.git,
>> with acks from Boris, then.
>
> Can you provide an immutable branch containing those changes?

No problem, I've created mtd-nand-trigger branch in the repository

git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git

-- 
Best regards,
Jacek Anaszewski
