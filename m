Received: from mta0.migadu.com (out-2.mta0.migadu.com [91.218.175.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785A84ACC81
	for <linux-leds@vger.kernel.org>; Wed, 23 Sep 2026 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166941; cv=none; b=BYzdxy9AY8ihV9nt3qNugUBbDIxiZ8fbq09YJ92npCbSVWzuuFdJJlIwH+zcHImuklxXLhfWEutfKT1FYpZN2henG5+PKq7uPDtdk/0ruZYRL4QW2IxUmOd/HUnXN/TkD7x6jttkB208CBWMl8HFlCeT/zxU+Q0/mUfDOEs7n9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166941; c=relaxed/simple;
	bh=e5yFryqU9aWRWdP5mY3XA6cqBcLkh/0eNT0p0eSXlZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jcs3qW8tBCPZmwQOXIjbAqB0t7GK01VQj358JUFGtDW1XGOS9F+gaG8YMazEOcUyLqmsOguHI9RkedAT0Bv94MTO5PJxGHhqa468nKsqWo/dxmuo/qhTfPrOkYBQ5L1uZLU/9IxCZnw9gIOVqsElkWNWxPYBfUub+MjAN/IwflU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SF7XW5sh; arc=none smtp.client-ip=91.218.175.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SF7XW5sh"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=e5yFryqU9aWRWdP5mY3XA6cqBcLkh/0eNT0p0eSXlZ8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790166937; v=1; x=1790771737;
 b=SF7XW5sh1WFtJT7BJdkZw07r+9k7h1F/18HojftC7uZTmVxlSJK7zi8x7j7s9lUunFQfI6D7
 m4EdRutBrfl3Xzr8Ql53pthEyhcizPYJIam15bW1n1cfkMCcRxXCSSBCHwrl4J1ggN6p0LlXdTX
 l+YrKRY52I0mXiuxwsq4hk3Y=
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1a2c5c2b78d5a3af;
	Wed, 23 Sep 2026 12:35:37 +0000
X-Mizu-Trace-ID: 1a2c5c2b78d5a3af
X-Migadu-Flow: FLOW_OUT
Message-ID: <52904b48-a5fa-4872-b9bf-a05b1b7bdea2@linux.dev>
Date: Wed, 23 Sep 2026 14:35:36 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v7 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver
 for ROG NVMe enclosures
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Liang Haowen <nbg2974@gmail.com>
Cc: linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, "Martin K . Petersen" <mkp@kernel.org>,
 linux-scsi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>, "Derek J. Clark"
 <derekjohn.clark@gmail.com>, Marco Scardovi <scardracs@disroot.org>,
 Ahmed Yaseen <yaseen@ghoul.dev>
References: <20260923103015.2365773-1-nbg2974@gmail.com>
 <d6cd20f2-dbad-58c5-d356-b9d1fa97ea44@linux.intel.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <d6cd20f2-dbad-58c5-d356-b9d1fa97ea44@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/23/26 12:41, Ilpo Järvinen wrote:
> On Wed, 23 Sep 2026, Liang Haowen wrote:
>
>> Hello,
>>
>> v7, as its own thread, addressing Lee's review of v6.
> No, you didn't address Lee's comments but only a small part of them. :-(
>
> Please slow down so you've time to address all feedback properly and 
> double check before the next submission you've addressed all feedback 
> you've received, not just part of it.
>
> In case you think there's a comment where the reviewer is wrong, do not 
> just silently ignore reviewer comments but engage by explaining why you 
> think the patch is fine as is.
>

Hi all,

This person is currently in asus-linux discor and he's doing what I asked him
to do: move LEDs commands from asusd (userspace) to the kernel and
for me the important part (and what I suggest review focus on) is having
a verified hardware handling code, while the led interface won't be final.

The weirdness of the driver comes from the fact that we agree on touching
the least amount possible of SCSI code since the storage part works
very well already and we simply want to bolt LEDs on top of it without
risking regressions on essential functionality.

Marco has drafted and is working on the new interface and published
a first version that I haven't got the time to review yet (university exams
period).

Anyway this interface should also be able to support what lenovo legion go
drivers currently do and when accepted it should be used by at the very least
asus, msi, lenovo but work will be long.

Liang please coordinate with Marco to use that interface (or draft a
version that can do that today). This will make like of userspace
tools developers (including other members of asus-linux) much easier.
Thanks.

Link: https://github.com/OpenGamingCollective/linux-unstable/pull/17

Best regards,
Denis Benato
