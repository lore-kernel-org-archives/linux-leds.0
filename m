Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6582345FFA2;
	Wed, 23 Sep 2026 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151173; cv=none; b=qZc1G9OxR0BTyCPfJzXPWhBSfjRWB696XtEDxw/vfCGP3g349SoFJHSHKOMIgr0QrRcjJgiVKDvO4hHaLuovlDIO8fp3PBk7Y0Ht7dZuc128obSL2Y31FUZ38nZgE5Z4irOVS73WbJZJCt/uuBChySq07c7cLJel6YPqH+Jehio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151173; c=relaxed/simple;
	bh=QfZqSnCYWHDYnbCTFd4SSNU3o8QmtV33Akxx9SOEkMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QwmTaDYGIyxqnxh/Vxb4WOexEkGxzmwViYMTrrwSpw/YVwjM6YyO/ZnKsXZAj0hP7G7+nZCJ6Un93agS/RbVDunw3AApeeKJuy66gVDDVdoT0ENtLd/DIGKRKdh5D0fPrykDcT8WWcdiejEPrd6xlz31VnZjvxOmBEg1b0sWEcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlZKNBYE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlZKNBYE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC9D11F000FF;
	Wed, 23 Sep 2026 08:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790151172;
	bh=Yw5asKPbYglD3KImzxfMIPbIzEg3rcuDPBP/SPk2xOM=;
	h=Date:From:To:Cc:Subject;
	b=dlZKNBYEOsot0ekiyQbgCyFWDoDMFU/H4VqWFGBD9ZnphOKwYz/c3VqbdVSH0/PI4
	 Q0pF89TYQpdN75fnFYydDxas0r9lJiAAtokTuf2511uUWmWLurOUAaAw4hc3j1hC3L
	 uqpQeIlMhayuTlWX+CZnc7lpHrz5BtSsnYSpFgML6cEzkBpfyK7tOPYeTj2Vt6cOk6
	 rjs7wMkwfOUx/am7Q9fxHrGSVnI0dC4zByEv7KjUoaWqA3tdMH/x7jmwDMWfZAt9Mv
	 uFX/8BBP9p/muy5shvAnDddsZgFK4Qvw34VEAw66f96Z+DzZ75x9AhkBQAUwXLsU+D
	 39eYOpe9OPqpw==
Date: Wed, 23 Sep 2026 09:12:49 +0100
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: LEDs: Seeking a maintainership Successor (drivers/leds)
Message-ID: <20260923081249.GF3438784@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'll make this brief.

Due to a sudden increase in workload, both as part of the day-job and in
other responsibilities, I'm looking to pass on my maintainership role of
the LEDs subsystem (drivers/leds).

Candidates should have a substantial contributor history and a decent
track record of reviewing submissions publicly.  In-depth knowledge of
the LED subsystem would be a highly beneficial, but isn't critical to
the task - I certainly didn't have that when I started - just make sure
your `git` and `grep` foo are up to scratch.  For obvious reasons, a
newcomer with a Gemini subscription isn't going to cut it.

To enter your hat into the ring, please respond to this mail, either as
a reply-to-all or privately.  If there are any questions, reach out and
I'll do my utmost to answer them honestly and thoroughly.

Please feel free to forward this on to anyone who may not have seen it.

All the best.

-- 
Lee Jones
