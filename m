Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8504EB865;
	Wed, 30 Sep 2026 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780570; cv=none; b=Z67bBMVZ6x7M78RBWLaKcpsI4eH+XLAWR3S+XivFjpria7dQkhij0hqI604dCDKW6trblxxMeT/huWkwJLmfooRp8UT6HipJM2tSGSJ/ktW1w2cfb4zkAfJupZheHALZQn3CP+7/2JZQYpwbWU+vyLwxIiWUV3dkH+yYMLwQ95E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780570; c=relaxed/simple;
	bh=RWGQe0LM27LxjwEnZa9zrQ02vdeEAUrwlM+P6b97Id0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSeJbSyZThTauhkwWmUFjVm9uF4gBibN79+/y8qM4TUYoaF/BNLUx2nM4np7vhvr8LdFaKVWh85KXtuyPwOx+VaXvag5qTkravQwOzCMUNZnCMH/nG9Sp1O6NnglWVbK3YLjB+4CLrtM8JV5gEP5n0sy2V9h01VkHyJeH59I10M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=D85DAJ7p; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fvsJf/dB; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="D85DAJ7p";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fvsJf/dB"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 3EFC61D0068A;
	Wed, 30 Sep 2026 11:02:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 30 Sep 2026 11:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790780558;
	 x=1790866958; bh=o4/MDrLpqqukPxJrGeH59ZkNS3uDf8VfP6QaZ1QiIEs=; b=
	D85DAJ7ppcUDTfcPTv/ifTOqVoxPuiiIifQBl6cLJJD0lFdB43Z2il2nvQacIoRj
	SCYIjYvH5xbYRvMUY89qnyQvJ8CtKjZoyPK74qBOldqgY32xm4jVRHPRPdWhRBnM
	GA6Q/6cevKEGbg6Bh48RAG9fofzfAINrPevQd6eqV6JJbNHsLKIQJGkkGdWqTQVe
	LsR89JyRGs8VgwrifOYVrifUBP9/TytImEvLH/QNh1RZRjfghFu9kwv0rM0jP2a9
	f8/HRv6azsd6DsMzqVpqJjA5VYdPExFZoUD62DlHijTN2pllHGO41UH8N4Itb15P
	a7RuIgCNZ/IKqw2TsFrAkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790780558; x=
	1790866958; bh=o4/MDrLpqqukPxJrGeH59ZkNS3uDf8VfP6QaZ1QiIEs=; b=f
	vsJf/dBgrlyo6DC01qt41sIs9kkbO1qDGEd9x1cBNuOcgunpvqCsLG8e8o14kGpJ
	gQFSMH8OWJNAHMTOpLPIgLjWwbzCMR9zq5rDhnVZhaYFdaCUfWDs7UeMFW2XTPm0
	9S8Gpxwv34+56z5Vm8iurzCjhgEs+gsvPyaA0tCxbzXxeI/twJP09c2WagJ78dSF
	Zuy8r+D8EDoj0I4fONRQkVKqmYyY9200dgAVLAR7Vcy8EhfeEBhtrDNq+ladIyFk
	fGDn3HGx5qgx+Lh4pDYDqrPezd/24cd+RZYfAfgfexGUL4d6Zi9jMPG5lPF6tbkT
	+f2sCea3Y18RgxqW9/kNg==
X-ME-Sender: <xms:jSS9alXKjrEEGMwwwyQ6fR3FGtPiHGpyFEz3LxLOxmVs8rBbxNcDbA>
    <xme:jSS9agijIK_gBC_tDo_ZPXIwHU__4fTfJzh1svWj_Gl8dj03sv0n9EHHO_ShPPpXq
    EPtWlXCtHeYiqUs_JgvquOtvysc_wokYd_xBA2aoIBUyqjT-L_x>
X-ME-Received: <xmr:jSS9agYRxyw59dCsysJ--ijOtI4DIn3sNYnxl0w6TqLea4Xt6Kq-DZdTVvMmhaAr-CNhN344UBDcxZeBHZM3ZmSEyi1hyeLI9BCz>
X-ME-Proxy-Cause: dmFkZTE+SUe7cVWq+61PUWVJCm5TBZxxEorC/9ceCpWA3WooeJdRg7M6bOgklvSh7DBbEc
    ys/3+XuhRemnlMVg4NXswSXLLZmIknrgu3Vh5+So6BUa3eeJDreJKkQxdlGzt1HM+cs59V
    XdTvB1o63Xa0pabBqPUoEd+jbHA0KNw6DvBBZcBw50B/ru7UlO3hF2iaQI9LVv4F770dAe
    CNgwVYgyqAXeNGFNZvD4YpDNK+9EiCjw7hN6Qzwwxgu8KovcLKS2C0PRPR5InQdiPsmWy0
    xPo2/RAb9tLhKh07fB/b060WxzTe94o/HofkKfBa9P1qvCWTQJnDEMGOCTN7LErz6MCFRg
    03G08HUKi2eDGkQYYBn5cR2TGy13AJGtrJw2nRlt6fKQ+vLK+TEIWhSRVAvsw34I4pfqei
    3c7DLONBtwtPL0Orsji1rf3ednd4VXyu9jDHQuw2mZcW/phrACIN8rCgRyubBGUu7V00MT
    2oOI2tm4ZJWhYfReoHn+APgW7BbwaKeRNvKwhf2tIyt+O2asgL3EjVM6RKusYiiKe/rVF3
    zUevVs1L1O9gWnz45eNthhM1bhCWO3XR8AySDiPe5enbToNX8sbBwzN2SiZkCW1+9M+xgM
    jOHfBFfEaqmBu7E8swd2Wfu/UFZaUMSqgJR0HEtldxlQ2+U9KwWv3BLJr/VA
X-ME-Proxy: <xmx:jSS9atqnY87E3_IBB0E-EPsxUoQeHSf8a2G0QFlR6NYtbySB_YG2mg>
    <xmx:jiS9atMveB0HMhuZyQ91y3Tz6sPJythXFKaAE-c5yj7Xw5Pjvi-o9g>
    <xmx:jiS9agpdVybekkyYzjk7wcGdAx-Hi3kVngvSlvvDFl0809JIx9XQIw>
    <xmx:jiS9aqdttokpF-mUQeBaGGYr-JUpmHFqR5jtEM4gXxRoJa98RQ3lWQ>
    <xmx:jiS9ase578lfDjTtr9rnvgsXA662DY3JAvqJ5CAedperRqD_r3djTMJQ>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Sep 2026 11:02:37 -0400 (EDT)
Message-ID: <c0318145-a999-43d0-b0fd-231256a89005@kroah.com>
Date: Wed, 30 Sep 2026 17:02:35 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] leds: Add driver for MAX8907 LED cell
To: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 mfd@lists.linux.dev
References: <20260930072732.66578-1-clamor95@gmail.com>
 <20260930072732.66578-2-clamor95@gmail.com>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin@kroah.com>
In-Reply-To: <20260930072732.66578-2-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/26 9:27 AM, Svyatoslav Ryhel wrote:

> Add a small driver to control the LED cell provided by the MAX8907 PMIC.
> The LED does not require any specific configuration and is folded into the
> PMIC's node.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/leds/Kconfig        |  7 ++++
>   drivers/leds/Makefile       |  1 +
>   drivers/leds/leds-max8907.c | 81 +++++++++++++++++++++++++++++++++++++
>   drivers/mfd/max8907.c       |  1 +
>   include/linux/mfd/max8907.h |  2 +-
>   5 files changed, 91 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/leds/leds-max8907.c

Sashiko said this does not apply, what tree did you make this against?

https://sashiko.dev/#/patchset/20260930072732.66578-2-clamor95@gmail.com


Thanks,

Griffin

