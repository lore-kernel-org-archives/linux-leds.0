From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
Date: Wed, 29 May 2019 22:44:01 +0200
Message-ID: <d9fa3435-a942-b6e4-c510-e70c59deae61@gmail.com>
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
 <20190522054256.GA4574@dell> <3492171a-bcdc-bee2-684c-e1029653a811@gmail.com>
 <20190523083129.GH4574@dell> <e7f332a3-ce4b-a058-74b3-3dfd8bccfbc8@gmail.com>
 <20190524115659.GC2456@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524115659.GC2456@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com
List-Id: linux-leds@vger.kernel.org

I've just noticed gmail redirected this message to the Spam folder.
I will have to improve my filters to secure myself against that.

Sorry for late reply and maybe unnecessary escalation of the issue.

On 5/24/19 1:56 PM, Mark Brown wrote:
> On Thu, May 23, 2019 at 10:07:35PM +0200, Jacek Anaszewski wrote:
>> On 5/23/19 10:31 AM, Lee Jones wrote:
> 
>>> Once an immutable branch is created, it should never, ever change.  I
>>> think this is the second pull-request I've had from you [0] and the
>>> second one you've wanted to retract.  That should not happen!
> 
>> This is life - it is always possible that some problems will be
>> detected in linux-next later in the cycle, either by bots or by other
>> people.
> 
> If you've created an immutable branch that other people might have
> merged you should be doing incremental fixes on top of it and not
> changing it unless you've confirmed that nobody else merged it, that's
> the whole immutable thing.  If you rebase the commits are still going to
> be in other people's trees and will still end up getting merged which
> makes a mess.

That's obvious. I checked that the branch wasn't pulled to any of
the affected subsystems. Also double-checked it wasn't present
in linux-next at the time I was dropping the signed tag,
and updating the branch.

>> Some time ago I referred to Linus' message from 2017 discouraging
>> maintainers from cross-merging their trees, which you didn't find
>> applicable to existing MFD workflow.
> 
>> Recently Linus put stress on that again [0].
> 
> There's a difference between just grabbing someone's whole tree and
> pulling in a targetted topic branch with only specific overlapping
> stuff.  There's also no requirement on people to immediately merge
> such a topic branch, they can always just keep it on file until it
> does become important for dependencies.  A lot of the MFD cross tree
> merges are happening because constants introduced in the MFD tree
> become build dependencies for other trees.
> 
> Historically there were maintainers who just randomly merged people's
> entire trees which does cause lots of problems, this isn't that.
> 
>> So please, if you find it reasonable to proceed with these immutable
>> branches workflow, I would first prefer to see Linus' approval for that.
> 
> This is nothing new.

I just wanted to make sure. We will see if Linus will have something
to add.

-- 
Best regards,
Jacek Anaszewski
