Received: from mail-pz2-f30.google.com (mail-pz2-f30.google.com [74.125.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E68415AADA
	for <linux-leds@vger.kernel.org>; Mon,  5 Oct 2026 15:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214608; cv=none; b=SwOjael1r1HckCxYiLzRZAA1LdbiJr8hXsgn0Rrpu1B/eERekOtdvRoE0dtoaBEgAcfe1typz1AOHhNHGv0Qp5wBTZA07tlN3y5K3Qb2oNZZ3Kcp6Dqh5S+sDu2siycw14iZ8/+cYSb1b0ui1QT5Ti1mf1OjnwcnrFXi91y6B1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214608; c=relaxed/simple;
	bh=rjpL4llTsXpkQauEKSLeEbt4jKXhpoQ8xqnmJ38lg5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNv4i67ph8JnkB++R3ArWLiCiFTMW4WhRXWBX3kP3HjA6eEa4eZ8J4KWZvEhnH74fD+MjZCk6rsLfmb0y6IFPTsVb2A8CZgJlx/F4Yhpx1AQYBaIcBjZrp9YPZFHa/43bV4iM5qZaIkRb0OS2A0P0iGEpF2rwRhx4cEhy56BWfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/QWJGba; arc=none smtp.client-ip=74.125.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/QWJGba"
Received: by mail-pz2-f30.google.com with SMTP id d2e1a72fcca58-88c687cf1adso485308b3a.3
        for <linux-leds@vger.kernel.org>; Mon, 05 Oct 2026 08:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791214606; x=1791819406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjpL4llTsXpkQauEKSLeEbt4jKXhpoQ8xqnmJ38lg5Y=;
        b=W/QWJGbaCvZicSiUvVgsntWJHBCVmPrS/XA7IBCapAD6EdPzzcFTc+tssuO9Z87Xn/
         a3m2e28svriSGJQPbEbbt8dGn6ikyFj7jjCvTpeuuOeRoy1CFHC1aB/k7szwdqY7/I3k
         +90hWu5keKNR7QYrqRbpmnkRMrYc2UnYj3UXLnBhGaNTkghczT8KvTOKSKtOoYsakMAX
         +xc3RgcSN5WTwRzWD99IAE8ewGebKxyUPoInx9VoMsN6JnqgJewXzRdqFCD7O7MJy5ax
         U8oieW24QcCZ3NTjVbDEr428b5w8tQKgXIJ9DsYm3q1Ec1hem+ctX0wDVMNwX6xjb6M7
         2Jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214606; x=1791819406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjpL4llTsXpkQauEKSLeEbt4jKXhpoQ8xqnmJ38lg5Y=;
        b=vL5QEANeNTNPLOv534Hjw2SGC/EybaXgULQsgeZSO4TbLAQ6OnpdOtnnkFxC8+5mq4
         5uuX7XcxR61UMVC87ubf8hZHGDbizrirEGpNlu7VP5CV2sKC/UuSSB169WMrhuLC9k/L
         4cplqiW/RGklqQyzWThGGmf4Wt4BZzIUROjgoVpJN62Wqvydec5bEr5s3dixQ/CzihEL
         njaNVUgBsdgc2e+ywHGQSXKQ2DlT4OgzSaFAeApVEm+A/3PGoI5UAzPjgR9M4ZM7h5/r
         1nGR0jFMAb+Sd55sm54uHECuGWYgGD7sGi/fTloFcwAddvv0KZhEQpSVVBdDcTMUdfR3
         Yhxw==
X-Forwarded-Encrypted: i=1; AKwUvBw1IUoLy5Rt5ZQxwzeaE5Iz7OnyiYuutv1N06lkzXbpIASPUouxd/dp0SPr2hOt4v0+SQaAKsHJRpE/@vger.kernel.org
X-Gm-Message-State: AFuF++l07iY3q6MiCTIZwyjmfrJId5JIXsUh2neDUwB0akv45n49tOLN
	TeMZNxvqFIjXE4IFPvVEYVHYsOyQIv6OTuQZ2IwTlWruiXE8PEbHNshVjXZSmwRF
X-Gm-Gg: AYBFou2uvNW6oH7vD1ZS9oaYgVQiiQgnz9iv2suofAe5BXHbHKejKuoshjqddxPeOD6
	CRQ6HNHD0B1nree38/uS9x/AQ4KT+r/0pSvv3eh1VY9cuzFMsw4Lp2r0qBppH3rfp5HuLWxNBUQ
	FZ7KGfRDqLhwqh2r5uSbrvvTP0F0qHEiu65YyqxfdOH8g+vhzo0RWhrq6GSYjmnRxURdHmEVNM7
	vOENdCzZMT0ImstkpPqPlIfOBSvd1KEqiZhfWRAxduwt75EA7lFdfRUDnzMYfdO3dd+koKDqLic
	gml+prIaVulFr4C2kXEm/+dcMevwVzuyNu3T/KGcUJOOGHw03PwRsA18wVEMXaSWmQiuY2B1jaE
	DdomR7fqYDYR4iptbwvgzbV23ibWe+fVf3QQgvE5FGs4sP4nBBh6CPXlYMSEJjI8Cp3kHXmEV/6
	Wzr0CvN/D0Zh0k/gMNIHZovQFN2xogDN52aUXaOt+aLCLw63y92a6XrrFdc1eh5YJRbLNm/eMbH
	3iwypGbt+fPwNG5eIHHw1Jv2yai
X-Received: by 2002:a05:6a00:f87:b0:874:705d:f652 with SMTP id d2e1a72fcca58-88af6e19923mr9775863b3a.32.1791214605735;
        Mon, 05 Oct 2026 08:36:45 -0700 (PDT)
Received: from localhost.localdomain ([119.14.238.184])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88d62aaf2f8sm1966099b3a.10.2026.10.05.08.36.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 08:36:45 -0700 (PDT)
From: Wayne Ho <wayneho219@gmail.com>
To: griffin@kroah.com
Cc: lee@kernel.org,
	pavel@kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: ABI: leds: inverted is specific to the backlight trigger
Date: Mon,  5 Oct 2026 23:35:55 +0800
Message-ID: <20261005153555.85944-1-wayneho219@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179119698191.10341.17981065372386761527.b4-review@b4>
References: <179119698191.10341.17981065372386761527.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 05 Oct 2026 12:43:01 +0200, Griffin Kroah-Hartman <griffin@kroah.com> wrote:
> What commit changed this? Should there be a fixes tag?

The inverted attribute was removed from the gpio trigger by commit
4a11dbf04f31 ("leds: triggers: gpio: Rewrite to use trigger-sources"),
which dropped the inversion handling since GPIO descriptors can describe
it themselves.

I've added the Fixes tag and referenced the commit in the changelog in v2:
https://lore.kernel.org/r/20261005-docs-leds-abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com

Thanks,
Wayne
